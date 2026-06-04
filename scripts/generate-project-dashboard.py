#!/usr/bin/env python3
"""Generate lightweight dashboard data for ai-product-delivery-workflow.

This script scans Markdown documents and JSON run records in the current
repository, then refreshes docs/dashboard/project-map.json and

docs/dashboard/runs.json.

It intentionally avoids databases, vector stores, backend services, and
external dependencies.
"""

from __future__ import annotations

import json
import os
import re
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

ROOT = Path.cwd()
DASHBOARD_DIR = ROOT / "docs" / "dashboard"
RUNS_DIR = ROOT / "docs" / "runs"
MEMORY_DIR = ROOT / "docs" / "memory"

EXCLUDED_DIRS = {".git", "node_modules", ".next", "dist", "build", "__pycache__"}
SENSITIVE_PATTERNS = [
    ".env",
    "secret",
    "secrets",
    "private_key",
    "id_rsa",
    "token",
    "credential",
    "credentials",
]

RISK_RE = re.compile(r"\b(P0|P1|P2|blocker|risk|todo|fixme)\b", re.IGNORECASE)
HEADING_RE = re.compile(r"^(#{1,6})\s+(.+)$", re.MULTILINE)


def is_excluded(path: Path) -> bool:
    return any(part in EXCLUDED_DIRS for part in path.parts)


def is_sensitive(path: Path) -> bool:
    lower = str(path).lower()
    return any(pattern in lower for pattern in SENSITIVE_PATTERNS)


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return ""


def extract_headings(text: str) -> list[str]:
    return [match.group(2).strip() for match in HEADING_RE.finditer(text)][:30]


def excerpt(text: str, limit: int = 220) -> str:
    clean = re.sub(r"\s+", " ", text).strip()
    return clean[:limit] + ("..." if len(clean) > limit else "")


def category_for(path: Path) -> str:
    rel = path.as_posix()
    if rel.startswith("docs/memory/"):
        return "memory"
    if rel.startswith("docs/runs/"):
        return "run"
    if rel.startswith("references/"):
        return "reference"
    if rel.startswith("docs/"):
        return "docs"
    if rel in {"README.md", "SKILL.md", "TODO.md", "AGENTS.md", "CLAUDE.md"}:
        return "root"
    return "other"


def risk_level(line: str) -> str:
    upper = line.upper()
    if "P0" in upper or "BLOCKER" in upper:
        return "P0"
    if "P1" in upper or "RISK" in upper:
        return "P1"
    return "P2"


def collect_documents() -> tuple[list[dict[str, Any]], list[dict[str, str]]]:
    documents: list[dict[str, Any]] = []
    risks: list[dict[str, str]] = []

    for path in sorted(ROOT.rglob("*.md")):
        rel_path = path.relative_to(ROOT)
        if is_excluded(rel_path):
            continue

        text = read_text(path)
        headings = extract_headings(text)
        content_allowed = not is_sensitive(rel_path)
        doc = {
            "path": rel_path.as_posix(),
            "title": headings[0] if headings else path.stem,
            "category": category_for(rel_path),
            "size_bytes": path.stat().st_size,
            "headings": headings,
            "excerpt": excerpt(text),
            "content_allowed": content_allowed,
            "content": text[:12000] if content_allowed else "Content withheld because the path may contain sensitive data.",
        }
        documents.append(doc)

        for line_no, line in enumerate(text.splitlines(), start=1):
            if RISK_RE.search(line):
                risks.append({
                    "level": risk_level(line),
                    "source": f"{rel_path.as_posix()}:{line_no}",
                    "text": line.strip()[:300],
                })

    return documents, risks[:100]


def collect_files() -> list[dict[str, Any]]:
    files: list[dict[str, Any]] = []
    for path in sorted(ROOT.rglob("*")):
        if not path.is_file():
            continue
        rel_path = path.relative_to(ROOT)
        if is_excluded(rel_path):
            continue
        files.append({
            "path": rel_path.as_posix(),
            "category": category_for(rel_path),
            "size_bytes": path.stat().st_size,
        })
    return files


def collect_runs() -> list[dict[str, Any]]:
    runs: list[dict[str, Any]] = []
    if not RUNS_DIR.exists():
        return runs

    for path in sorted(RUNS_DIR.glob("*.json")):
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except Exception as exc:  # noqa: BLE001
            data = {
                "id": path.stem,
                "status": "invalid",
                "summary": f"Failed to parse run record: {exc}",
            }
        runs.append({
            "id": data.get("id", path.stem),
            "mode": data.get("mode", "unknown"),
            "status": data.get("status", "unknown"),
            "started_at": data.get("started_at"),
            "ended_at": data.get("ended_at"),
            "summary": data.get("summary") or data.get("master_agent_decision", ""),
            "agents_used": data.get("agents_used", []),
            "files_created_count": len(data.get("files_created", [])),
            "files_modified_count": len(data.get("files_modified", [])),
            "p0_count": len(data.get("p0_blockers", [])),
            "p1_count": len(data.get("p1_risks", [])),
            "p2_count": len(data.get("p2_improvements", [])),
            "next_actions": data.get("next_actions", []),
        })
    return runs


def main() -> None:
    DASHBOARD_DIR.mkdir(parents=True, exist_ok=True)
    RUNS_DIR.mkdir(parents=True, exist_ok=True)
    MEMORY_DIR.mkdir(parents=True, exist_ok=True)

    documents, risks = collect_documents()
    files = collect_files()
    runs = collect_runs()

    project_map = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "project_root": str(ROOT),
        "summary": {
            "docs": len(documents),
            "memory_files": len(list(MEMORY_DIR.glob("*.md"))) if MEMORY_DIR.exists() else 0,
            "run_records": len(runs),
            "risks": len(risks),
        },
        "documents": documents,
        "files": files,
        "risks": risks,
        "next_actions": [
            "Review P0/P1 risks in the dashboard.",
            "Update run records after meaningful agent work.",
            "Regenerate dashboard after documentation or memory changes.",
        ],
    }

    (DASHBOARD_DIR / "project-map.json").write_text(
        json.dumps(project_map, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    (DASHBOARD_DIR / "runs.json").write_text(
        json.dumps(runs, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    print("Generated docs/dashboard/project-map.json")
    print("Generated docs/dashboard/runs.json")
    print(f"Documents: {len(documents)}")
    print(f"Runs: {len(runs)}")
    print(f"Risks: {len(risks)}")


if __name__ == "__main__":
    os.chdir(ROOT)
    main()
