"""Provider-neutral LLM clients for T2M experiments.

Every client implements the ``LLMClient`` protocol used by the extractors::

    complete(prompt: str) -> str        # returns a JSON document as text

and exposes ``provider_status`` plus ``last_usage`` (token counts when the
provider reports them). Structured output is requested in the strongest form
each provider supports, and the returned text is always validated against the
JSON Schema locally before it is handed back, with bounded retries.

Supported APIs (no vendor SDK required except the ``openai`` package):

* ``openai_responses`` — OpenAI Responses API, ``json_schema`` strict.
* ``openai_chat``      — any OpenAI-compatible Chat Completions endpoint
  (OpenAI, Google Gemini OpenAI-compat, vLLM, Ollama, LiteLLM …) via ``base_url``.
  Gemini's OpenAI-compat endpoint enforces ``json_schema`` (verified 2026-09-28).
* ``anthropic``        — Anthropic Messages API over HTTPS; the schema is passed as
  a forced tool so the model must return a schema-shaped tool input.

Build clients from a registry entry with :func:`make_client`.
"""

from __future__ import annotations

import hashlib
import json
import os
import time
import urllib.error
import urllib.request
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from .openai_client import T2M_CANDIDATE_SCHEMA, load_dotenv_if_present

DEFAULT_SYSTEM_PROMPT = "Extract traceable Text2Model candidate JSON. Preserve source evidence exactly."


class LLMCallError(RuntimeError):
    """Raised when a provider call fails after all retries."""


def _validate(text: str, schema: dict | None) -> None:
    """Parse ``text`` as JSON and validate it against ``schema`` (if given)."""
    payload = json.loads(text)
    if schema:
        import jsonschema

        jsonschema.validate(payload, schema)


def _strip_fences(text: str) -> str:
    stripped = text.strip()
    if stripped.startswith("```"):
        stripped = stripped.split("\n", 1)[1] if "\n" in stripped else ""
        if stripped.rstrip().endswith("```"):
            stripped = stripped.rstrip()[:-3]
    return stripped.strip()


@dataclass
class _Base:
    model: str
    schema: dict | None = field(default_factory=lambda: T2M_CANDIDATE_SCHEMA)
    schema_name: str = "t2m_candidate_layer"
    system_prompt: str = DEFAULT_SYSTEM_PROMPT
    temperature: float | None = 0.0
    max_output_tokens: int | None = None
    max_retries: int = 3
    retry_backoff_s: float = 4.0
    validate_output: bool = True
    load_dotenv_file: bool = True
    last_usage: dict = field(default_factory=dict, init=False)
    last_attempts: int = field(default=0, init=False)

    api_name = "base"

    @property
    def provider_status(self) -> str:
        return f"{self.api_name}:{self.model}"

    def _call(self, prompt: str) -> tuple[str, dict]:  # pragma: no cover - abstract
        raise NotImplementedError

    def complete(self, prompt: str) -> str:
        if self.load_dotenv_file:
            load_dotenv_if_present()
        last_error: Exception | None = None
        for attempt in range(1, self.max_retries + 1):
            self.last_attempts = attempt
            try:
                text, usage = self._call(prompt)
                text = _strip_fences(text)
                if self.validate_output:
                    _validate(text, self.schema)
                self.last_usage = usage
                return text
            except Exception as exc:  # noqa: BLE001 - provider errors are heterogeneous
                last_error = exc
                if attempt < self.max_retries:
                    time.sleep(self.retry_backoff_s * attempt)
        raise LLMCallError(f"{self.provider_status} failed after {self.max_retries} attempts: {last_error}") from last_error


def _key(env_name: str) -> str:
    value = os.environ.get(env_name)
    if not value:
        raise LLMCallError(f"environment variable {env_name} is not set")
    return value


@dataclass
class OpenAIResponsesClient(_Base):
    """OpenAI Responses API with strict JSON Schema output."""

    base_url: str | None = None
    api_key_env: str = "OPENAI_API_KEY"
    reasoning_effort: str | None = None
    api_name = "openai_responses"

    def _call(self, prompt: str) -> tuple[str, dict]:
        from openai import OpenAI

        client = OpenAI(api_key=_key(self.api_key_env), base_url=self.base_url) if self.base_url else OpenAI(api_key=_key(self.api_key_env))
        kwargs: dict[str, Any] = {
            "model": self.model,
            "input": [{"role": "system", "content": self.system_prompt}, {"role": "user", "content": prompt}],
        }
        if self.schema:
            kwargs["text"] = {"format": {"type": "json_schema", "name": self.schema_name, "strict": True, "schema": self.schema}}
        if self.max_output_tokens:
            kwargs["max_output_tokens"] = self.max_output_tokens
        if self.reasoning_effort:
            kwargs["reasoning"] = {"effort": self.reasoning_effort}
        response = client.responses.create(**kwargs)
        usage = getattr(response, "usage", None)
        usage_dict = usage.model_dump() if hasattr(usage, "model_dump") else (dict(usage) if usage else {})
        return response.output_text, usage_dict


@dataclass
class OpenAIChatClient(_Base):
    """Any OpenAI-compatible Chat Completions endpoint.

    ``schema_mode``: ``json_schema`` (strict structured output), ``json_object``
    (JSON mode; the schema is appended to the prompt) or ``none``.
    """

    base_url: str | None = None
    api_key_env: str = "OPENAI_API_KEY"
    schema_mode: str = "json_schema"
    seed: int | None = None
    api_name = "openai_chat"

    def _call(self, prompt: str) -> tuple[str, dict]:
        from openai import OpenAI

        client = OpenAI(api_key=_key(self.api_key_env), base_url=self.base_url) if self.base_url else OpenAI(api_key=_key(self.api_key_env))
        user = prompt
        kwargs: dict[str, Any] = {"model": self.model}
        if self.schema and self.schema_mode == "json_schema":
            kwargs["response_format"] = {"type": "json_schema", "json_schema": {"name": self.schema_name, "strict": True, "schema": self.schema}}
        elif self.schema_mode == "json_object":
            kwargs["response_format"] = {"type": "json_object"}
            if self.schema:
                user = f"{prompt}\n\nReturn one JSON object that validates against this JSON Schema:\n{json.dumps(self.schema, ensure_ascii=False)}"
        kwargs["messages"] = [{"role": "system", "content": self.system_prompt}, {"role": "user", "content": user}]
        if self.temperature is not None:
            kwargs["temperature"] = self.temperature
        if self.max_output_tokens:
            kwargs["max_tokens"] = self.max_output_tokens
        if self.seed is not None:
            kwargs["seed"] = self.seed
        response = client.chat.completions.create(**kwargs)
        usage = getattr(response, "usage", None)
        usage_dict = usage.model_dump() if hasattr(usage, "model_dump") else {}
        return response.choices[0].message.content or "", usage_dict


@dataclass
class AnthropicMessagesClient(_Base):
    """Anthropic Messages API over HTTPS; structured output via a forced tool."""

    api_key_env: str = "ANTHROPIC_API_KEY"
    base_url: str = "https://api.anthropic.com"
    anthropic_version: str = "2023-06-01"
    timeout_s: float = 600.0
    # "tool" = forced tool call (older models); "output_config" = output_config.format json_schema
    # (required on models that reject forced tool_choice, e.g. claude-opus-5-5)
    schema_mode: str = "tool"
    effort: str | None = None
    stream: bool = False
    api_name = "anthropic"

    def _call(self, prompt: str) -> tuple[str, dict]:
        body: dict[str, Any] = {
            "model": self.model,
            "max_tokens": self.max_output_tokens or 32000,
            "system": self.system_prompt,
            "messages": [{"role": "user", "content": prompt}],
        }
        if self.temperature is not None:
            body["temperature"] = self.temperature
        output_config: dict[str, Any] = {}
        if self.effort:
            output_config["effort"] = self.effort
        if self.schema and self.schema_mode == "output_config":
            output_config["format"] = {"type": "json_schema", "schema": self.schema}
        elif self.schema:
            body["tools"] = [{"name": self.schema_name, "description": "Return the extraction result.", "input_schema": self.schema}]
            body["tool_choice"] = {"type": "tool", "name": self.schema_name}
        if output_config:
            body["output_config"] = output_config
        if self.stream:
            return self._call_stream(body)
        request = urllib.request.Request(
            f"{self.base_url.rstrip('/')}/v1/messages",
            data=json.dumps(body).encode("utf-8"),
            headers={
                "content-type": "application/json",
                "x-api-key": _key(self.api_key_env),
                "anthropic-version": self.anthropic_version,
            },
            method="POST",
        )
        try:
            with urllib.request.urlopen(request, timeout=self.timeout_s) as resp:
                data = json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as exc:
            raise LLMCallError(f"anthropic HTTP {exc.code}: {exc.read().decode('utf-8', 'replace')[:500]}") from exc
        usage = data.get("usage", {})
        for block in data.get("content", []):
            if block.get("type") == "tool_use":
                return json.dumps(block.get("input", {}), ensure_ascii=False), usage
        text = "".join(block.get("text", "") for block in data.get("content", []) if block.get("type") == "text")
        if data.get("stop_reason") not in (None, "end_turn", "tool_use"):
            raise LLMCallError(f"anthropic stop_reason {data.get('stop_reason')}: {data.get('stop_details')}")
        return text, usage

    def _call_stream(self, body: dict) -> tuple[str, dict]:
        """Server-sent events; long outputs need streaming. Returns the concatenated text blocks."""
        body = {**body, "stream": True}
        request = urllib.request.Request(
            f"{self.base_url.rstrip('/')}/v1/messages",
            data=json.dumps(body).encode("utf-8"),
            headers={"content-type": "application/json", "x-api-key": _key(self.api_key_env),
                     "anthropic-version": self.anthropic_version},
            method="POST",
        )
        texts: dict[int, list[str]] = {}
        usage: dict = {}
        stop_reason, stop_details = None, None
        try:
            with urllib.request.urlopen(request, timeout=self.timeout_s) as resp:
                for raw in resp:
                    line = raw.decode("utf-8").strip()
                    if not line.startswith("data:"):
                        continue
                    ev = json.loads(line[5:].strip())
                    t = ev.get("type")
                    if t == "message_start":
                        usage.update(ev["message"].get("usage", {}))
                    elif t == "content_block_start" and ev["content_block"].get("type") == "text":
                        texts[ev["index"]] = [ev["content_block"].get("text", "")]
                    elif t == "content_block_delta" and ev["delta"].get("type") == "text_delta":
                        texts.setdefault(ev["index"], []).append(ev["delta"]["text"])
                    elif t == "message_delta":
                        usage.update(ev.get("usage", {}))
                        stop_reason = ev.get("delta", {}).get("stop_reason", stop_reason)
                        stop_details = ev.get("delta", {}).get("stop_details", stop_details)
                    elif t == "error":
                        raise LLMCallError(f"anthropic stream error: {ev.get('error')}")
        except urllib.error.HTTPError as exc:
            raise LLMCallError(f"anthropic HTTP {exc.code}: {exc.read().decode('utf-8', 'replace')[:500]}") from exc
        if stop_reason not in ("end_turn", None):
            raise LLMCallError(f"anthropic stop_reason {stop_reason}: {stop_details}")
        return "".join("".join(texts[i]) for i in sorted(texts)), usage


GEMINI_OPENAI_BASE_URL = "https://generativelanguage.googleapis.com/v1beta/openai/"


def make_client(spec: dict, *, schema: dict | None = T2M_CANDIDATE_SCHEMA, schema_name: str = "t2m_candidate_layer",
                system_prompt: str = DEFAULT_SYSTEM_PROMPT):
    """Build a client from a registry entry.

    Entry keys: ``api`` (openai_responses | openai_chat | anthropic | google),
    ``model``, optional ``base_url``, ``api_key_env``, ``schema_mode``,
    ``temperature``, ``max_output_tokens``, ``reasoning_effort``, ``seed``.
    """
    api = spec["api"]
    common = {
        "model": spec["model"],
        "schema": schema,
        "schema_name": schema_name,
        "system_prompt": system_prompt,
        "temperature": spec.get("temperature", 0.0),
        "max_output_tokens": spec.get("max_output_tokens"),
    }
    if api == "openai_responses":
        return OpenAIResponsesClient(**common, base_url=spec.get("base_url"), api_key_env=spec.get("api_key_env", "OPENAI_API_KEY"),
                                     reasoning_effort=spec.get("reasoning_effort"))
    if api == "openai_chat":
        return OpenAIChatClient(**common, base_url=spec.get("base_url"), api_key_env=spec.get("api_key_env", "OPENAI_API_KEY"),
                                schema_mode=spec.get("schema_mode", "json_schema"), seed=spec.get("seed"))
    if api == "google":
        return OpenAIChatClient(**common, base_url=spec.get("base_url", GEMINI_OPENAI_BASE_URL),
                                api_key_env=spec.get("api_key_env", "GOOGLE_API_KEY"),
                                schema_mode=spec.get("schema_mode", "json_schema"), seed=spec.get("seed"))
    if api == "anthropic":
        return AnthropicMessagesClient(**common, api_key_env=spec.get("api_key_env", "ANTHROPIC_API_KEY"),
                                       base_url=spec.get("base_url", "https://api.anthropic.com"),
                                       schema_mode=spec.get("schema_mode", "tool"), effort=spec.get("effort"),
                                       stream=bool(spec.get("stream", False)))
    raise ValueError(f"unknown api: {api}")


class CachedClient:
    """Content-addressed disk cache around any ``LLMClient``.

    The cache key covers the inner provider status, the prompt and a sample index,
    so repeated runs (``sample`` 0..k-1) are cached separately and an experiment can
    be re-scored offline from the cache alone. Each entry stores prompt, response,
    usage and wall time — the cache directory *is* the experiment cassette.
    """

    def __init__(self, inner, cache_dir: str | Path, sample: int = 0, offline: bool = False) -> None:
        self.inner = inner
        self.cache_dir = Path(cache_dir)
        self.sample = sample
        self.offline = offline
        self.last_hit = False
        self.last_usage: dict = {}

    @property
    def provider_status(self) -> str:
        return f"cached[{getattr(self.inner, 'provider_status', type(self.inner).__name__)}]#s{self.sample}"

    def key(self, prompt: str) -> str:
        material = json.dumps([getattr(self.inner, "provider_status", ""), self.sample, prompt], ensure_ascii=False)
        return hashlib.sha256(material.encode("utf-8")).hexdigest()

    def complete(self, prompt: str) -> str:
        path = self.cache_dir / f"{self.key(prompt)}.json"
        if path.is_file():
            entry = json.loads(path.read_text(encoding="utf-8"))
            self.last_hit = True
            self.last_usage = entry.get("usage", {})
            return entry["response"]
        if self.offline:
            raise LLMCallError(f"cache miss in offline mode: {path.name}")
        started = time.time()
        response = self.inner.complete(prompt)
        entry = {
            "provider_status": getattr(self.inner, "provider_status", ""),
            "sample": self.sample,
            "prompt": prompt,
            "response": response,
            "usage": getattr(self.inner, "last_usage", {}),
            "attempts": getattr(self.inner, "last_attempts", None),
            "wall_s": round(time.time() - started, 3),
            "created": time.strftime("%Y-%m-%dT%H:%M:%S"),
        }
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(entry, ensure_ascii=False, indent=1), encoding="utf-8")
        self.last_hit = False
        self.last_usage = entry["usage"]
        return response


def load_registry(path: str | Path) -> dict[str, dict]:
    """Load a model registry JSON: {"models": {"id": {...spec...}}}."""
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    return data["models"]
