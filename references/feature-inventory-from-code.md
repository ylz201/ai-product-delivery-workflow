# Feature Inventory From Code

Version: v0.3.3 feature inventory patch

## Purpose

For legacy projects, the dashboard must show not only documents and runs, but also the functional modules that can be inferred from the codebase.

Old projects often have missing PRDs, incomplete docs, and undocumented operator workflows. Therefore the agent must first reverse-map the project from code evidence before judging project status or planning refactors.

Core principle:

```text
Code evidence first. Business confirmation second. Refactor last.
```

## When To Use

Use this patch when the project is:

- old;
- undocumented;
- partially documented;
- business-critical;
- inherited from another team;
- unclear in scope;
- already running but hard to change;
- suspected to contain hidden business rules.

## Required Dashboard Section

Add a `Feature Inventory` section to the dashboard.

Each feature should show:

```text
Feature name:
Category:
Evidence source:
Status:
Risk level:
Owner / reviewer:
Verification:
Next action:
```

## Feature Status Model

Use these states:

```text
DISCOVERED           Found from code or docs but not verified.
ROUTE_DISCOVERED     Route/page/API path found.
API_DISCOVERED       API endpoint or handler found.
UI_DISCOVERED        UI page/component/menu found.
DATA_DISCOVERED      Data model/table/schema/storage found.
WORKFLOW_INFERRED    Multi-step workflow inferred from code evidence.
DOCUMENTED           Documented in project docs.
BUSINESS_CONFIRMED   Confirmed by business/operator.
BASELINE_VERIFIED    Verified by script/test/manual smoke.
TEST_COVERED         Covered by automated or documented manual test.
READY_FOR_CHANGE     Safe to change in a bounded slice.
LOCKED_LEGACY        Do not change without explicit approval.
UNKNOWN              Insufficient evidence.
```

## Evidence Sources

Look for feature evidence in:

- routes;
- pages;
- API handlers;
- controller/service names;
- React/Vue/Svelte components;
- backend modules;
- database schemas and migration files;
- scheduled jobs;
- scripts;
- menu labels;
- test files;
- docs;
- run records.

## Code Evidence Heuristics

Common file patterns:

```text
app/**/page.*
pages/**
routes/**
api/**
controllers/**
services/**
components/**
models/**
schemas/**
migrations/**
jobs/**
workers/**
scripts/**
tests/**
e2e/**
```

Common code patterns:

```text
app.get(...)
app.post(...)
router.get(...)
router.post(...)
export default function
function ComponentName
class ServiceName
CREATE TABLE
model / schema definitions
describe(...) / test(...)
```

## Required Generator Output

The dashboard generator should produce:

```text
docs/dashboard/feature-map.json
```

Recommended schema:

```json
{
  "generated_at": "2026-06-04T00:00:00Z",
  "features": [
    {
      "name": "Passport workbench",
      "category": "ui-workflow",
      "status": "UI_DISCOVERED",
      "risk": "P1",
      "evidence": [
        {"path": "client-app/src/pages/passport.tsx", "kind": "page"},
        {"path": "server/routes/passport.js", "kind": "api"}
      ],
      "verification": "Missing fresh browser QA",
      "next_action": "Run baseline workflow and update capability matrix"
    }
  ]
}
```

## Master Agent Rule

When taking over a legacy project, the Master Agent must:

1. infer features from code and docs;
2. mark each feature with a conservative status;
3. never treat discovered features as business-confirmed;
4. add verification tasks for high-risk features;
5. show feature inventory in the dashboard;
6. use the inventory to plan migration slices.

## Important Rule

A feature found in code is not necessarily intended, active, correct, or safe to change.

The correct progression is:

```text
DISCOVERED -> DOCUMENTED -> BUSINESS_CONFIRMED -> BASELINE_VERIFIED -> READY_FOR_CHANGE
```
