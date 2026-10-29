"""OpenAI Responses API client for the T2M LLM extractor."""

from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path


T2M_CANDIDATE_SCHEMA = {
    "type": "object",
    "additionalProperties": False,
    "required": [
        "mentions",
        "referents",
        "propositions",
        "relations",
        "actions",
        "attributes",
        "requirements",
        "use_cases",
        "constraints",
        "allocations",
        "interfaces",
        "concerns",
        "viewpoints",
        "views",
        "packages",
        "namespaces",
        "expressions",
    ],
    "properties": {
        "mentions": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["mention_id", "unit_id", "text", "role_hint"],
                "properties": {
                    "mention_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "text": {"type": "string"},
                    "role_hint": {"type": "string"},
                },
            },
        },
        "referents": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["referent_id", "label", "category_hint", "mention_ids"],
                "properties": {
                    "referent_id": {"type": "string"},
                    "label": {"type": "string"},
                    "category_hint": {"type": "string"},
                    "mention_ids": {"type": "array", "items": {"type": "string"}},
                },
            },
        },
        "propositions": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["proposition_id", "unit_id", "predicate_hint", "evidence_text"],
                "properties": {
                    "proposition_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "predicate_hint": {"type": "string"},
                    "evidence_text": {"type": "string"},
                },
            },
        },
        "relations": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "relation_id",
                    "unit_id",
                    "family",
                    "source",
                    "target",
                    "payload",
                    "condition",
                    "evidence_text",
                    "confidence",
                    "alternatives",
                ],
                "properties": {
                    "relation_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "family": {"type": "string", "enum": ["composition", "flow", "transition", "succession"]},
                    "source": {"type": "string"},
                    "target": {"type": "string"},
                    "payload": {"type": ["string", "null"]},
                    "condition": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                    "alternatives": {
                        "type": "array",
                        "items": {
                            "type": "object",
                            "additionalProperties": False,
                            "required": [
                                "family",
                                "source",
                                "target",
                                "payload",
                                "confidence",
                                "compatibility",
                                "rationale",
                                "evidence_text",
                            ],
                            "properties": {
                                "family": {"type": "string", "enum": ["composition", "flow", "transition", "succession", "dependency", "causation"]},
                                "source": {"type": "string"},
                                "target": {"type": "string"},
                                "payload": {"type": ["string", "null"]},
                                "confidence": {"type": "number"},
                                "compatibility": {"type": "string", "enum": ["exclusive", "compatible"]},
                                "rationale": {"type": ["string", "null"]},
                                "evidence_text": {"type": "string"},
                            },
                        },
                    },
                },
            },
        },
        "actions": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "action_id",
                    "unit_id",
                    "label",
                    "performer",
                    "object",
                    "trigger",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "action_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "label": {"type": "string"},
                    "performer": {"type": ["string", "null"]},
                    "object": {"type": ["string", "null"]},
                    "trigger": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "attributes": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "attribute_id",
                    "unit_id",
                    "owner",
                    "name",
                    "value",
                    "unit",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "attribute_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "owner": {"type": "string"},
                    "name": {"type": "string"},
                    "value": {"type": "string"},
                    "unit": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "requirements": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "requirement_id",
                    "unit_id",
                    "text",
                    "subject",
                    "constraint_hint",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "requirement_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "text": {"type": "string"},
                    "subject": {"type": ["string", "null"]},
                    "constraint_hint": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "use_cases": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "use_case_id",
                    "unit_id",
                    "name",
                    "actor",
                    "goal",
                    "trigger",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "use_case_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "actor": {"type": ["string", "null"]},
                    "goal": {"type": ["string", "null"]},
                    "trigger": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "constraints": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "constraint_id",
                    "unit_id",
                    "expression_text",
                    "constrained_element",
                    "owner",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "constraint_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "expression_text": {"type": "string"},
                    "constrained_element": {"type": ["string", "null"]},
                    "owner": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "allocations": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "allocation_id",
                    "unit_id",
                    "from_element",
                    "to_element",
                    "allocation_kind",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "allocation_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "from_element": {"type": "string"},
                    "to_element": {"type": "string"},
                    "allocation_kind": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "interfaces": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "interface_id",
                    "unit_id",
                    "name",
                    "source",
                    "target",
                    "item",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "interface_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "source": {"type": ["string", "null"]},
                    "target": {"type": ["string", "null"]},
                    "item": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "concerns": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "concern_id",
                    "unit_id",
                    "name",
                    "stakeholder",
                    "subject",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "concern_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "stakeholder": {"type": ["string", "null"]},
                    "subject": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "viewpoints": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "viewpoint_id",
                    "unit_id",
                    "name",
                    "stakeholder",
                    "concern",
                    "method",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "viewpoint_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "stakeholder": {"type": ["string", "null"]},
                    "concern": {"type": ["string", "null"]},
                    "method": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "views": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "view_id",
                    "unit_id",
                    "name",
                    "viewpoint",
                    "subject",
                    "exposed_element",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "view_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "viewpoint": {"type": ["string", "null"]},
                    "subject": {"type": ["string", "null"]},
                    "exposed_element": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "packages": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["package_id", "unit_id", "name", "purpose", "evidence_text", "confidence"],
                "properties": {
                    "package_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "purpose": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "namespaces": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["namespace_id", "unit_id", "name", "package", "member_hint", "evidence_text", "confidence"],
                "properties": {
                    "namespace_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "name": {"type": "string"},
                    "package": {"type": ["string", "null"]},
                    "member_hint": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
        "expressions": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": [
                    "expression_id",
                    "unit_id",
                    "expression_text",
                    "kerml_expression",
                    "value_hint",
                    "unit_hint",
                    "owner",
                    "source_constraint_id",
                    "evidence_text",
                    "confidence",
                ],
                "properties": {
                    "expression_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "expression_text": {"type": "string"},
                    "kerml_expression": {"type": ["string", "null"]},
                    "value_hint": {"type": ["string", "null"]},
                    "unit_hint": {"type": ["string", "null"]},
                    "owner": {"type": ["string", "null"]},
                    "source_constraint_id": {"type": ["string", "null"]},
                    "evidence_text": {"type": "string"},
                    "confidence": {"type": "number"},
                },
            },
        },
    },
}


@dataclass(frozen=True)
class AiClient:
    """Runtime AI client backed by the OpenAI Responses API.

    Environment values are loaded from a nearby .env file when present.
    """

    model: str | None = None
    load_dotenv_file: bool = True

    @classmethod
    def from_env(cls, model: str | None = None) -> "AiClient":
        return cls(model=model)

    @property
    def provider_status(self) -> str:
        model = self.model or os.environ.get("OPENAI_MODEL") or "gpt-5.6-sol"
        return f"openai_responses_api:{model}"

    def complete(self, prompt: str) -> str:
        if self.load_dotenv_file:
            load_dotenv_if_present()
        api_key = os.environ.get("OPENAI_API_KEY")
        if not api_key:
            raise RuntimeError("OPENAI_API_KEY is required for AI LLM extraction")
        try:
            from openai import OpenAI
        except ImportError as exc:
            raise RuntimeError("Install the OpenAI Python SDK with `pip install openai`") from exc

        client = OpenAI(api_key=api_key)
        model = self.model or os.environ.get("OPENAI_MODEL") or "gpt-5.6-sol"
        response = client.responses.create(
            model=model,
            input=[
                {
                    "role": "system",
                    "content": "Extract traceable Text2Model candidate JSON. Preserve source evidence exactly.",
                },
                {"role": "user", "content": prompt},
            ],
            text={
                "format": {
                    "type": "json_schema",
                    "name": "t2m_candidate_layer",
                    "strict": True,
                    "schema": T2M_CANDIDATE_SCHEMA,
                }
            },
        )
        return response.output_text


def load_dotenv_if_present() -> Path | None:
    """Load simple KEY=VALUE entries from a nearby .env.

    The local .env is the selected runtime contract for this development CLI, so
    values in the file override inherited process variables.
    """
    for path in _dotenv_candidates():
        if path.is_file():
            _load_dotenv(path)
            return path
    return None


def _dotenv_candidates() -> list[Path]:
    package_dir = Path(__file__).resolve().parent
    roots = [Path.cwd(), *Path.cwd().parents, package_dir, *package_dir.parents]
    candidates: list[Path] = []
    seen: set[Path] = set()
    for root in roots:
        path = root / ".env"
        if path not in seen:
            candidates.append(path)
            seen.add(path)
    return candidates


def _load_dotenv(path: Path) -> None:
    for raw_line in path.read_text(encoding="utf-8-sig").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        key = key.strip()
        if not key:
            continue
        os.environ[key] = _clean_env_value(value)


def _clean_env_value(value: str) -> str:
    value = value.strip()
    if len(value) >= 2 and value[0] == value[-1] and value[0] in {"'", '"'}:
        return value[1:-1]
    return value


OpenAIResponsesClient = AiClient
