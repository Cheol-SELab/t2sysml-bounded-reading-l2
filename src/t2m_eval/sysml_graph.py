"""SysML v2 text -> element/relation graph via the selab-rust-lsp server.

Used to score *any* method's SysML output (free-form Direct-LLM baseline included)
on the same footing: the text is opened on the LSP, and
``selab.diagram.getGraphEx`` returns nodes (qualified id + metaclass kind) and
edges (kind + endpoints); ``selab.diagnostics.filter`` returns parser/semantic
diagnostics.

    with SysmlGraphClient() as lsp:
        g = lsp.analyze(text)
        g.nodes_of("PartUsage"), g.edges_of("flow"), g.errors

Set ``SELAB_LSP_BIN`` to override the server binary.
"""

from __future__ import annotations

import json
import os
import subprocess
import threading
import time
from dataclasses import dataclass, field
from pathlib import Path

_DEFAULT_BIN = Path(__file__).resolve().parents[4] / "selab-ex-system-modeler" / "packages" / "selab-rust-lsp" / "target" / "release" / (
    "sysml-lsp.exe" if os.name == "nt" else "sysml-lsp"
)
LSP_BIN = Path(os.environ.get("SELAB_LSP_BIN", str(_DEFAULT_BIN)))


def lsp_available() -> bool:
    return LSP_BIN.is_file()


@dataclass
class SysmlGraph:
    nodes: list[dict] = field(default_factory=list)
    edges: list[dict] = field(default_factory=list)
    diagnostics: list[dict] = field(default_factory=list)

    @property
    def errors(self) -> list[dict]:
        return [d for d in self.diagnostics if d.get("severity") == 1]

    def nodes_of(self, *kinds: str) -> list[dict]:
        return [n for n in self.nodes if n.get("kind") in kinds]

    def edges_of(self, *kinds: str) -> list[dict]:
        return [e for e in self.edges if e.get("kind") in kinds]

    def kind_counts(self) -> dict[str, int]:
        out: dict[str, int] = {}
        for n in self.nodes:
            out[n.get("kind", "?")] = out.get(n.get("kind", "?"), 0) + 1
        return out

    @staticmethod
    def short(qualified_id: str) -> str:
        return qualified_id.split("::")[-1]


class SysmlGraphClient:
    """Minimal JSON-RPC-over-stdio LSP client (one server process, many documents)."""

    def __init__(self, binary: Path | None = None, timeout_s: float = 60.0) -> None:
        self.binary = Path(binary or LSP_BIN)
        self.timeout_s = timeout_s
        self._proc: subprocess.Popen | None = None
        self._next_id = 1
        self._pending: dict[int, dict] = {}
        self._cv = threading.Condition()
        self._doc = 0

    # -- lifecycle -------------------------------------------------------------
    def __enter__(self) -> "SysmlGraphClient":
        self.start()
        return self

    def __exit__(self, *exc) -> None:
        self.close()

    def start(self) -> None:
        if not self.binary.is_file():
            raise FileNotFoundError(f"sysml-lsp not found: {self.binary}")
        self._proc = subprocess.Popen([str(self.binary)], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
        threading.Thread(target=self._reader, daemon=True).start()
        self._request("initialize", {"processId": os.getpid(), "rootUri": None, "capabilities": {}})
        self._notify("initialized", {})

    def close(self) -> None:
        if not self._proc:
            return
        try:
            self._request("shutdown", {}, timeout_s=5)
            self._notify("exit", {})
        except Exception:  # noqa: BLE001
            pass
        time.sleep(0.1)
        self._proc.kill()
        self._proc = None

    # -- protocol --------------------------------------------------------------
    def _send(self, message: dict) -> None:
        body = json.dumps(message).encode("utf-8")
        assert self._proc and self._proc.stdin
        self._proc.stdin.write(f"Content-Length: {len(body)}\r\n\r\n".encode("ascii") + body)
        self._proc.stdin.flush()

    def _reader(self) -> None:
        assert self._proc and self._proc.stdout
        stream = self._proc.stdout
        while True:
            header = b""
            while not header.endswith(b"\r\n\r\n"):
                ch = stream.read(1)
                if not ch:
                    return
                header += ch
            length = 0
            for line in header.decode("ascii", "replace").split("\r\n"):
                if line.lower().startswith("content-length:"):
                    length = int(line.split(":", 1)[1])
            body = stream.read(length)
            try:
                msg = json.loads(body.decode("utf-8"))
            except json.JSONDecodeError:
                continue
            if "method" in msg and "id" in msg:  # server -> client request
                result = [None] * len(msg.get("params", {}).get("items", [])) if msg["method"] == "workspace/configuration" else None
                self._send({"jsonrpc": "2.0", "id": msg["id"], "result": result})
            elif "id" in msg:
                with self._cv:
                    self._pending[msg["id"]] = msg
                    self._cv.notify_all()

    def _notify(self, method: str, params: dict) -> None:
        self._send({"jsonrpc": "2.0", "method": method, "params": params})

    def _request(self, method: str, params: dict, timeout_s: float | None = None):
        rid = self._next_id
        self._next_id += 1
        self._send({"jsonrpc": "2.0", "id": rid, "method": method, "params": params})
        deadline = time.time() + (timeout_s or self.timeout_s)
        with self._cv:
            while rid not in self._pending:
                remaining = deadline - time.time()
                if remaining <= 0:
                    raise TimeoutError(f"{method} timed out")
                self._cv.wait(remaining)
            msg = self._pending.pop(rid)
        if "error" in msg:
            raise RuntimeError(f"{method}: {msg['error']}")
        return msg.get("result")

    # -- API -------------------------------------------------------------------
    def analyze(self, text: str) -> SysmlGraph:
        self._doc += 1
        uri = f"file:///t2m-eval/doc{self._doc}.sysml"
        self._notify("textDocument/didOpen", {"textDocument": {"uri": uri, "languageId": "sysml", "version": 1, "text": text}})
        try:
            graph = self._request("workspace/executeCommand", {"command": "selab.diagram.getGraphEx",
                                                               "arguments": [{"uri": uri, "text": text, "includeCst": False}]})
            if not isinstance(graph, dict):
                raise RuntimeError("LSP graph response is missing or malformed")
            graph = graph.get("result", graph)
            if not isinstance(graph, dict):
                raise RuntimeError("LSP graph result is malformed")
            diags = self._request("workspace/executeCommand", {"command": "selab.diagnostics.filter", "arguments": [{"uri": uri}]})
            if isinstance(diags, dict):
                diags = diags.get("diagnostics")
            if not isinstance(diags, list) or any(not isinstance(d, dict) for d in diags):
                raise RuntimeError("LSP diagnostics response is missing or malformed")
        finally:
            self._notify("textDocument/didClose", {"textDocument": {"uri": uri}})
        return SysmlGraph(nodes=graph.get("nodes", []), edges=graph.get("edges", []), diagnostics=diags)
