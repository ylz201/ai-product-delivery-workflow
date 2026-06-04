# Lightweight Memory And Project Dashboard

Version: v0.3.2 memory/dashboard patch

## Purpose

Before introducing a heavy v0.4 enterprise observability system, use a simple file-based memory and static HTML dashboard.

The goal is to make the managed target project visible and controllable:

- What is the project?
- What docs exist?
- What is inside each doc?
- What did the agent do in recent runs?
- What files changed?
- What risks remain?
- What should happen next?

Core principle:

```text
Markdown memory + JSON run records + static HTML dashboard + Git history.
```

Do not introduce a database, vector store, backend service, login system, or cloud dashboard until this simple approach proves useful.

## Required Files In A Managed Target Project

```text
docs/memory/project-memory.md
docs/memory/decisions.md
docs/memory/mistakes.md
docs/memory/patterns.md
docs/memory/user-preferences.md
docs/runs/
docs/dashboard/index.html
docs/dashboard/project-map.json
docs/dashboard/runs.json
scripts/generate-project-dashboard.py
```

## Memory Layers

### 1. Project Memory

Path:

```text
docs/memory/project-memory.md
```

Contains:

```markdown
# Project Memory

## Product Goal

## Current Architecture

## Important Decisions

## Current Constraints

## User Preferences

## Known Risks

## Things Never To Repeat

## Active Roadmap
```

### 2. Decisions

Path:

```text
docs/memory/decisions.md
```

Contains:

```markdown
# Decisions

## YYYY-MM-DD

Decision:
Reason:
Alternatives:
Consequence:
Revisit condition:
```

### 3. Mistakes And Process Fixes

Path:

```text
docs/memory/mistakes.md
```

Contains:

```markdown
# Mistakes And Process Fixes

## Miss

## Root Cause

## Gate That Should Have Caught It

## New Rule

## New Test
```

## Run Records

Each meaningful agent run should create a run record:

```text
docs/runs/YYYY-MM-DD-run-XXX.json
```

Recommended schema:

```json
{
  "id": "2026-06-04-run-001",
  "mode": "Project Bootstrap Mode",
  "status": "completed",
  "started_at": "2026-06-04T10:00:00+08:00",
  "ended_at": "2026-06-04T10:18:00+08:00",
  "master_agent_decision": "Use Project Bootstrap Mode because user requested runnable MVP",
  "agents_used": ["Master Agent", "Chief Architect Agent", "QA Lead Agent"],
  "steps": [
    {"name": "LEARN", "status": "done", "evidence": "inspected repository docs"},
    {"name": "ANALYZE", "status": "done", "evidence": "identified missing baseline"},
    {"name": "CREATE", "status": "done", "evidence": "created dashboard files"},
    {"name": "EVALUATE", "status": "partial", "evidence": "manual browser check pending"}
  ],
  "files_created": ["docs/dashboard/index.html"],
  "files_modified": ["SKILL.md"],
  "commands_run": ["python3 scripts/generate-project-dashboard.py"],
  "p0_blockers": [],
  "p1_risks": ["Dashboard is static and local only"],
  "next_actions": ["Open docs/dashboard/index.html"]
}
```

## Project Map

The dashboard reads:

```text
docs/dashboard/project-map.json
```

Recommended schema:

```json
{
  "generated_at": "2026-06-04T10:00:00+08:00",
  "project_root": ".",
  "summary": {
    "docs": 12,
    "memory_files": 5,
    "run_records": 3,
    "risks": 2
  },
  "documents": [
    {
      "path": "docs/PRD.md",
      "title": "PRD",
      "category": "product",
      "size_bytes": 1200,
      "headings": ["Outcome", "Users", "Acceptance Criteria"],
      "excerpt": "Short preview...",
      "content": "Full markdown content when allowed"
    }
  ],
  "files": [
    {"path": "README.md", "category": "root", "size_bytes": 3000}
  ],
  "risks": [
    {"level": "P1", "source": "docs/BASELINE_REPORT.md", "text": "Browser QA missing"}
  ]
}
```

## Static Dashboard

Path:

```text
docs/dashboard/index.html
```

Minimum dashboard sections:

1. Project overview
2. Documentation tree
3. Document content viewer
4. Memory files
5. Recent run timeline
6. Files changed
7. P0/P1/P2 risks
8. Next actions
9. Search box

The dashboard should work as a static HTML file. It may try to load `project-map.json` and `runs.json`, but it should also allow pasting or loading JSON manually if browser local file restrictions block fetch.

## Dashboard Generation

Use:

```bash
python3 scripts/generate-project-dashboard.py
```

The script should:

- scan markdown docs;
- scan memory files;
- scan run records;
- extract headings;
- extract risk markers such as P0, P1, P2, blocker, risk, TODO;
- generate `docs/dashboard/project-map.json`;
- generate or refresh `docs/dashboard/runs.json`.

## Master Agent Rule

For every meaningful run, the Master Agent should:

1. update or create one run record;
2. update memory files when a stable lesson, decision, risk, or user preference is learned;
3. refresh dashboard data;
4. report where the dashboard can be opened.

## Do Not Overbuild

Do not add:

- database;
- vector store;
- backend server;
- authentication;
- complex frontend framework;
- cloud deployment;
- paid observability platform.

Only add these after the file-based dashboard demonstrates clear value and repeated usage.
