"""String/number normalization for field-level scoring (Korean and English)."""

from __future__ import annotations

import re
import unicodedata

# Trailing Korean particles that carry case, not content ("시스템은" == "시스템").
_JOSA = (
    "에게서", "으로부터", "로부터", "에서는", "에서", "에게", "까지", "부터", "으로", "로서", "로써",
    "처럼", "보다", "은", "는", "이", "가", "을", "를", "에", "의", "와", "과", "로", "도", "만",
)
_PUNCT = re.compile(r"[\s\"'`“”‘’.,;:!?()\[\]{}<>·]+")
_EN_ARTICLES = re.compile(r"^(the|a|an)\s+", re.IGNORECASE)


def strip_josa(token: str) -> str:
    for josa in _JOSA:
        if len(token) > len(josa) and token.endswith(josa):
            return token[: -len(josa)]
    return token


def norm_text(value: str | None) -> str:
    """Lowercase, NFKC, drop articles/punctuation, strip Korean particles per token."""
    if value is None:
        return ""
    text = unicodedata.normalize("NFKC", str(value)).strip().lower()
    text = _EN_ARTICLES.sub("", text)
    tokens = [strip_josa(t) for t in _PUNCT.split(text) if t]
    return " ".join(t for t in tokens if t)


def tokens(value: str | None) -> list[str]:
    return norm_text(value).split()


def token_f1(pred: str | None, gold: str | None) -> float:
    p, g = tokens(pred), tokens(gold)
    if not p or not g:
        return 0.0
    common = 0
    remaining = list(g)
    for t in p:
        if t in remaining:
            remaining.remove(t)
            common += 1
    if common == 0:
        return 0.0
    precision, recall = common / len(p), common / len(g)
    return 2 * precision * recall / (precision + recall)


def text_match(pred: str | None, gold: str | None, mode: str = "relaxed") -> bool:
    """``exact``: normalized equality. ``relaxed``: exact, containment, or token-F1 >= 0.5."""
    np_, ng = norm_text(pred), norm_text(gold)
    if not np_ or not ng:
        return False
    if np_ == ng:
        return True
    if mode == "exact":
        return False
    compact_p, compact_g = np_.replace(" ", ""), ng.replace(" ", "")
    if compact_p in compact_g or compact_g in compact_p:
        return True
    return token_f1(pred, gold) >= 0.5


_OPERATOR_MAP = {
    "이하": "<=", "이내": "<=", "넘지": "<=", "최대": "<=", "<=": "<=", "≤": "<=", "at most": "<=", "no more than": "<=",
    "within": "<=", "less than or equal": "<=", "or less": "<=", "maximum": "<=",
    "이상": ">=", "최소": ">=", ">=": ">=", "≥": ">=", "at least": ">=", "no less than": ">=", "or more": ">=",
    "greater than or equal": ">=", "minimum": ">=",
    "미만": "<", "<": "<", "less than": "<", "below": "<", "under": "<",
    "초과": ">", ">": ">", "more than": ">", "greater than": ">", "above": ">", "exceed": ">",
    "동일": "==", "같": "==", "==": "==", "=": "==", "equal": "==", "exactly": "==",
}


def norm_operator(value: str | None) -> str:
    if value is None:
        return ""
    text = unicodedata.normalize("NFKC", str(value)).strip().lower()
    if not text:
        return ""
    for key in sorted(_OPERATOR_MAP, key=len, reverse=True):
        if key in text:
            return _OPERATOR_MAP[key]
    return text


_NUMBER = re.compile(r"-?\d+(?:[.,]\d+)?")


def norm_number(value: str | None) -> float | None:
    if value is None:
        return None
    match = _NUMBER.search(unicodedata.normalize("NFKC", str(value)))
    if not match:
        return None
    try:
        return float(match.group(0).replace(",", "."))
    except ValueError:
        return None


_UNIT_MAP = {
    "초": "s", "sec": "s", "secs": "s", "second": "s", "seconds": "s", "s": "s",
    "분": "min", "min": "min", "mins": "min", "minute": "min", "minutes": "min",
    "시간": "h", "h": "h", "hr": "h", "hrs": "h", "hour": "h", "hours": "h",
    "일": "d", "day": "d", "days": "d", "년": "yr", "year": "yr", "years": "yr",
    "밀리초": "ms", "ms": "ms", "millisecond": "ms", "milliseconds": "ms",
    "미터": "m", "m": "m", "meter": "m", "meters": "m", "metre": "m", "metres": "m",
    "센티미터": "cm", "cm": "cm", "킬로미터": "km", "km": "km",
    "km/h": "km/h", "kph": "km/h", "퍼센트": "%", "%": "%", "percent": "%",
    "회/초": "1/s", "hz": "1/s", "대": "unit", "units": "unit", "개": "unit",
}


def norm_unit(value: str | None) -> str:
    if value is None:
        return ""
    text = unicodedata.normalize("NFKC", str(value)).strip().lower()
    return _UNIT_MAP.get(text, text)
