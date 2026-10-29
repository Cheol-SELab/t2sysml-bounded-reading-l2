"""Render a consolidated L2 fact ledger as SysML v2 textual notation.

One part definition and one part usage per element, one item definition per carried item, a flow
usage per flow, a perform action per action, an exhibit state per state set and a requirement
definition per requirement. Every rendered element carries its source unit ids in a doc comment
so the model stays traceable. Only facts whose entity slots are filled are rendered; facts with
unresolved endpoints are counted, not guessed.
"""

from __future__ import annotations

import re


def ident(name: str) -> str:
    words = re.findall(r"[A-Za-z0-9]+", name or "")
    out = "".join(w[:1].upper() + w[1:] for w in words) or "Unnamed"
    return f"E{out}" if out[:1].isdigit() else out


MISSING = {"null", "none", "unknown", "n/a", "na", "unspecified"}
RESERVED = {"null", "true", "false", "part", "item", "action", "state", "flow", "system", "package", "in", "out", "inout",
            "def", "ref", "all", "and", "or", "not", "xor", "if", "then", "else", "first", "from", "to", "of", "for",
            "doc", "comment", "import", "private", "public", "protected", "abstract", "variation", "variant", "message",
            "requirement", "constraint", "attribute", "port", "interface", "connection", "allocation", "event", "do",
            "entry", "exit", "accept", "send", "via", "at", "after", "when", "assert", "assume", "require", "subject",
            "actor", "stakeholder", "objective", "frame", "verify", "satisfy", "expose", "view", "render", "language"}


def key(name: str) -> str:
    """Names that render to the same identifier denote one element ("Dispatchers" = "dispatchers")."""
    return ident(name.strip())


def _doc(text: str) -> str:
    return (text or "").replace("*/", "* /").replace("\n", " ")


def render(facts: list[dict], package: str = "L2Model") -> tuple[str, dict]:
    elements: dict[str, set[str]] = {}
    items: dict[str, set[str]] = {}
    flows, actions, reqs, states, skipped = [], [], [], {}, 0

    def el(name, uid):
        if isinstance(name, str) and name.strip() and name.strip().lower() not in MISSING:
            elements.setdefault(key(name), set()).add(uid or "")
            return True
        return False

    for f in facts:
        uid, t = f.get("unit_id"), f.get("type")
        if t == "flow":
            if el(f.get("source"), uid) & el(f.get("target"), uid) and f.get("payload"):
                items.setdefault(key(f["payload"]), set()).add(uid or "")
                flows.append(f)
            else:
                skipped += 1
        elif t == "action":
            if el(f.get("performer"), uid) and f.get("label"):
                actions.append(f)
            else:
                skipped += 1
        elif t == "requirement":
            if el(f.get("subject"), uid) and f.get("text"):
                reqs.append(f)
            else:
                skipped += 1
        elif t == "state":
            if el(f.get("owner"), uid) and f.get("label"):
                states.setdefault(key(f["owner"]), {}).setdefault(f["label"].strip(), set()).add(uid or "")
            else:
                skipped += 1
        elif t == "composition":
            if el(f.get("whole"), uid):
                for p in f.get("parts") or []:
                    el(p, uid)
    # an element and an item may share a name; items keep their own namespace
    lines = [f"package {ident(package)} {{"]
    for name, uids in sorted(items.items()):
        lines.append(f"    item def {name}Item {{ doc /* @{','.join(sorted(u for u in uids if u))} */ }}")
    for name, uids in sorted(elements.items()):
        lines.append(f"    part def {name} {{ doc /* @{','.join(sorted(u for u in uids if u))} */ }}")
    lines.append("    part system {")
    used: dict[str, str] = {}
    for name in sorted(elements):
        u = name[:1].lower() + name[1:]
        if u in RESERVED or name.lower() in RESERVED:
            u = f"{u}Part"
        while u in used.values():
            u += "_"
        used[name] = u
        body = []
        for i, a in enumerate(x for x in actions if key(x["performer"]) == name):
            body.append(f"            perform action a{i} {{ doc /* {_doc(a['label'])} @{a.get('unit_id')} */ }}")
        if name in states:
            body.append("            exhibit state modes {")
            for j, (label, uids) in enumerate(sorted(states[name].items())):
                body.append(f"                state s{j} {{ doc /* {_doc(label)} @{','.join(sorted(u for u in uids if u))} */ }}")
            body.append("            }")
        if body:
            lines += [f"        part {u} : {name} {{", *body, "        }"]
        else:
            lines.append(f"        part {u} : {name};")
    seen = set()
    for i, f in enumerate(flows):
        k = (key(f["source"]), key(f["target"]), key(f["payload"]))
        if k in seen:
            continue
        seen.add(k)
        tag = "joined " if f.get("joined") else ""
        ev = ",".join(f.get("evidence_units") or [f.get("unit_id") or ""])
        lines.append(f"        flow f{i} of {k[2]}Item from {used[k[0]]} to {used[k[1]]} {{ doc /* {tag}@{ev} */ }}")
    lines.append("    }")
    for i, r in enumerate(reqs):
        lines.append(f"    requirement def R{i} {{ doc /* {_doc(r['text'])} @{r.get('unit_id')} */ subject s : {key(r['subject'])}; }}")
    lines.append("}")
    stats = {"elements": len(elements), "items": len(items), "flows": len(seen), "actions": len(actions),
             "requirements": len(reqs), "state_owners": len(states), "skipped_unresolved": skipped}
    return "\n".join(lines) + "\n", stats
