# Dashboard Template

Version: v0.3.3 dashboard template patch

## Purpose

Use this template to prevent generated project dashboards from drifting into arbitrary layouts.

The dashboard is not a decorative status page. It is a project management control surface for the Master Agent, project manager, architect, QA reviewer, and business owner.

Every generated dashboard should answer these questions in a stable order:

1. What is this project trying to achieve?
2. What phase is it in?
3. Can it be released now?
4. What functions/modules exist?
5. What is each function's status?
6. What is blocked?
7. Who or which agent owns the next action?
8. What evidence proves the current status?
9. What documents exist and what do they contain?
10. What should happen next?

## Non-Negotiable Layout

Every dashboard must preserve this section order.

```text
1. Executive Summary
2. Release Decision
3. Feature / Module Inventory
4. Workstream Status
5. Risk Register
6. Verification Evidence
7. Documentation Map
8. Recent Agent Runs
9. Decisions Needed
10. Next Actions
11. Technical Details
```

Do not replace this structure with a free-form visual page.

## 1. Executive Summary

Purpose: let a project manager understand the project in 30 seconds.

Required fields:

```text
Project name:
Business goal:
Current phase:
Overall status:
Release posture:
Last verified at:
Main blocker:
Next milestone:
```

Recommended status values:

```text
DISCOVERY
LEGACY_ASSIMILATION
BASELINE_VERIFICATION
ACTIVE_DEVELOPMENT
QA_VALIDATION
RELEASE_CANDIDATE
RELEASED
PAUSED
BLOCKED
```

Recommended release posture values:

```text
NOT_RELEASE_READY
INTERNAL_ONLY
READY_FOR_QA
READY_FOR_STAGING
READY_FOR_PRODUCTION
RELEASED
ROLLBACK_REQUIRED
```

## 2. Release Decision

Purpose: make the release answer explicit.

Required fields:

```text
Release decision: YES / NO / CONDITIONAL
Reason:
Blocking P0 risks:
Required approvals:
Required verification:
Rollback readiness:
```

Rules:

- If any P0 risk is open, release decision must be `NO`.
- If browser QA is stale for changed UI, release decision must not be `YES`.
- If production mutation is possible, required human approval must be visible.

## 3. Feature / Module Inventory

Purpose: show what functions exist and where they stand.

This is mandatory for legacy projects.

Columns:

```text
Feature / Module
Category
Evidence Source
Inferred From
Status
Risk
Owner / Agent
Verification
Next Action
```

Allowed feature status values:

```text
DISCOVERED
ROUTE_DISCOVERED
API_DISCOVERED
UI_DISCOVERED
DATA_DISCOVERED
WORKFLOW_INFERRED
DOCUMENTED
BUSINESS_CONFIRMED
BASELINE_VERIFIED
TEST_COVERED
READY_FOR_CHANGE
LOCKED_LEGACY
UNKNOWN
```

Feature status progression:

```text
DISCOVERED -> DOCUMENTED -> BUSINESS_CONFIRMED -> BASELINE_VERIFIED -> READY_FOR_CHANGE
```

Rule:

A feature inferred from code is not automatically business-confirmed or safe to change.

## 4. Workstream Status

Purpose: show active execution lanes.

Columns:

```text
Workstream
Status
Priority
Owner / Agent
Blocker
Next Action
Due / Target
Evidence Link
```

Allowed workstream status values:

```text
NOT_STARTED
DISCOVERING
IN_PROGRESS
BLOCKED
NEEDS_QA
NEEDS_APPROVAL
DONE
PAUSED
```

## 5. Risk Register

Purpose: turn warnings into managed risks.

Columns:

```text
Risk ID
Level
Description
Impact
Owner / Agent
Mitigation
Status
Required Decision
Evidence
```

Allowed risk levels:

```text
P0_BLOCKER
P1_MAJOR
P2_MINOR
```

Allowed risk status values:

```text
OPEN
MITIGATING
WAITING_FOR_APPROVAL
ACCEPTED
RESOLVED
```

Rules:

- P0 risks must appear above P1/P2 risks.
- Risks must have owner and mitigation.
- A dashboard with open P0 risks must show `NOT_RELEASE_READY`.

## 6. Verification Evidence

Purpose: show what proves the current state.

Columns:

```text
Check
Command / Method
Result
Last Run
Evidence Path
Owner / Agent
Next Required Check
```

Common verification checks:

```text
Install check
Build check
Typecheck
Lint
Unit tests
Integration tests
E2E tests
Browser QA
API smoke
Database migration check
Legacy baseline check
```

## 7. Documentation Map

Purpose: show the project documentation tree and content.

Required fields for each document:

```text
Path
Title
Category
Headings
Excerpt
Content preview
Last updated
Related feature/module
```

Rules:

- Do not include secrets, private keys, tokens, credentials, or sensitive personal data.
- Sensitive files should be listed as withheld, not embedded.
- Documentation must be searchable.

## 8. Recent Agent Runs

Purpose: show what the Master Agent and specialist agents actually did.

Columns:

```text
Run ID
Mode
Status
Agents Used
Files Changed
Commands Run
P0/P1/P2 Counts
Verification Result
Next Actions
```

Allowed run status values:

```text
PLANNED
IN_PROGRESS
COMPLETED
PARTIAL
BLOCKED
FAILED
```

## 9. Decisions Needed

Purpose: separate agent work from human judgment.

Columns:

```text
Decision
Why Needed
Options
Recommended Option
Owner
Deadline
Impact If Delayed
```

Common decision types:

```text
Business rule confirmation
Production mutation approval
Release approval
Architecture tradeoff
Legacy behavior confirmation
Data migration approval
```

## 10. Next Actions

Purpose: make the project actionable.

Columns:

```text
Action
Priority
Owner / Agent
Expected Output
Due / Target
Dependency
```

Rules:

- Next actions must be concrete.
- Avoid vague actions such as "continue improving".
- Each action should produce a file, verification result, decision, or resolved risk.

## 11. Technical Details

Purpose: keep technical context available without overwhelming the manager.

Suggested subsections:

```text
System boundaries
Architecture map
Data boundary
Automation boundary
Environment assumptions
Deployment assumptions
Frozen legacy areas
```

Technical details should be below management sections, not above them.

## Dashboard Data Contract

A generator may provide one combined data file:

```text
docs/dashboard/dashboard-data.json
```

Recommended schema:

```json
{
  "project": {
    "name": "Project name",
    "business_goal": "Goal",
    "phase": "LEGACY_ASSIMILATION",
    "overall_status": "BLOCKED",
    "release_posture": "NOT_RELEASE_READY",
    "last_verified_at": "2026-06-04T00:00:00Z",
    "main_blocker": "Fresh QA missing",
    "next_milestone": "Baseline verification"
  },
  "release_decision": {
    "decision": "NO",
    "reason": "Open P0 risks",
    "required_approvals": [],
    "required_verification": []
  },
  "features": [],
  "workstreams": [],
  "risks": [],
  "verification": [],
  "documents": [],
  "runs": [],
  "decisions_needed": [],
  "next_actions": [],
  "technical_details": {}
}
```

Existing files such as `project-map.json`, `feature-map.json`, and `runs.json` may remain separate, but the dashboard UI must render them into this fixed layout.

## Visual Rules

- Top section must show release posture and blocker.
- Feature inventory must be visible above technical boundaries.
- P0 risks must be red and appear before all other risks.
- Next actions must show owner/agent and expected output.
- Technical implementation details should not replace management status.
- The dashboard should remain readable on a laptop screen without horizontal scrolling for core sections.

## Anti-Drift Rules

Do not generate a dashboard that only shows:

- decorative charts;
- technology names without business meaning;
- generic agent workflow steps without project state;
- risks without owners;
- workstreams without next actions;
- documents without content preview;
- code modules without feature status;
- release status without evidence.

## Minimum Acceptance Criteria

A dashboard passes if a project manager can answer within one minute:

1. What is the project status?
2. Can we release?
3. Which functions exist?
4. Which functions are verified?
5. Which functions are locked or risky?
6. What are the P0 blockers?
7. What should be done next?
8. Who or which agent owns the next action?
9. Where is the evidence?
10. Which documents define the project?
