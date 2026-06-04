# Legacy Project Assimilation Mode

Version: v0.3.1 legacy patch

## Purpose

Use this mode when taking over an old, running, undocumented, fragile, or business-critical project.

The goal is not to rewrite the old project. The goal is to bring it back under the `ai-product-delivery-workflow` system with safety, documentation, baseline verification, and controlled migration.

Core principle:

```text
Do not refactor first. Assimilate first.
```

## When To Trigger

Trigger this mode when the user says or implies:

- old project
- legacy project
- existing system
- undocumented project
- production project
- fragile codebase
- take over this repo
- bring this project back under control
- 老项目
- 旧项目
- 接手老系统
- 不敢改的项目
- 先不要重构

## Mandatory Safety Rules

1. Do not refactor first.
2. Do not change behavior before baseline verification.
3. Do not assume existing behavior is intended business logic.
4. Treat current behavior as evidence, not automatically as correct design.
5. Preserve running behavior unless a change is explicitly approved.
6. Create documentation and verification coverage before major changes.
7. Identify production, database, credential, and deployment risks before editing.
8. Prefer read-only inspection during the first pass.

## Legacy Assimilation Loop

```text
FREEZE -> INVENTORY -> RECONSTRUCT -> BASELINE -> CLASSIFY -> PLAN -> SLICE -> VERIFY -> FEEDBACK
```

Definitions:

- `FREEZE`: protect current state, branch, environment, secrets, and production behavior.
- `INVENTORY`: discover stack, folders, entry points, routes, APIs, jobs, dependencies, environments, and deployment.
- `RECONSTRUCT`: create As-Is architecture and recovered product contract.
- `BASELINE`: establish commands and checks that prove current behavior before change.
- `CLASSIFY`: mark capabilities as safe, risky, locked, replaceable, or unknown.
- `PLAN`: create migration roadmap and recovery slices.
- `SLICE`: change only one bounded area at a time.
- `VERIFY`: compare against baseline and acceptance checks.
- `FEEDBACK`: record what was learned and update project instructions.

## Required Outputs

For a legacy project intake, create or update:

```text
docs/LEGACY_SAFETY_CHECK.md
docs/LEGACY_INVENTORY.md
docs/ARCHITECTURE_AS_IS.md
docs/PRODUCT_CONTRACT_RECOVERED.md
docs/CAPABILITY_MATRIX.md
docs/BASELINE_REPORT.md
docs/MIGRATION_ROADMAP.md
docs/adr/
scripts/baseline.sh
scripts/verify.sh, if missing
```

If any output cannot be created, report the blocker explicitly.

## Legacy Agent Resource Plan

For old project takeover, consider these agents:

```text
Master Agent:
  Overall control, mode selection, risk management, final gate.

Legacy Architect Agent:
  As-Is architecture, Target architecture, migration architecture, irreversible decisions.

Code Archaeologist Agent:
  Entry points, hidden rules, dead code, fragile modules, dependency map.

Business Rule Extractor Agent:
  Recovered workflows, implicit business rules, operator behavior, unclear assumptions.

Data Lineage Agent:
  Tables, fields, migrations, historical data, data ownership, compatibility risk.

QA Baseline Agent:
  Smoke tests, existing tests, baseline scripts, regression surfaces.

Security/Secrets Agent:
  Secrets, logs, permissions, production access, sensitive data exposure.

Migration Planner Agent:
  Low-risk slices, rollback plans, freeze zones, replacement candidates.
```

## Legacy Safety Check Template

```markdown
# Legacy Safety Check

## Repository State
Current branch:
Git clean status:
Latest commit:
Untracked files:
Protected branch:

## Runtime And Environment
Local run possible:
Test environment:
Production environment:
Environment variables:
Secrets present:
Database connection:
External services:

## Change Safety
Can edit files safely:
Requires approval before edit:
Frozen areas:
Backup required:
Rollback path:

## Immediate Blockers
P0 blockers:
P1 risks:
Unknowns:
```

## Legacy Inventory Template

```markdown
# Legacy Inventory

## Stack
Language/framework:
Package manager:
Build system:
Runtime:
Database:
Deployment:

## Entry Points
App entry:
API entry:
Worker/job entry:
CLI entry:

## Surfaces
Pages/routes:
APIs:
Background jobs:
Scheduled tasks:
Integrations:
Auth/permissions:

## Commands
Install:
Dev/start:
Build:
Test:
Lint/typecheck:
Deploy:

## Unknowns
Unknown modules:
Unclear dependencies:
Unclear owners:
```

## As-Is Architecture Template

```markdown
# Architecture As-Is

## System Boundary

## Module Map

## Data Flow

## API / Integration Flow

## Auth And Permission Model

## Persistence Model

## Deployment Model

## High-Risk Areas

## Frozen Areas

## Technical Debt

## Unknowns
```

## Recovered Product Contract Template

```markdown
# Product Contract Recovered

## Current Users / Operators

## Current Workflows

## Current Business Rules

## Rules In Code

## Rules In Database

## Rules In Manual Operation

## Rules That Need Business Confirmation

## Known Deviations Or Bugs

## Non-Goals During Assimilation
```

## Capability Matrix States

Use these states for legacy capabilities:

```text
DISCOVERED           Found but not verified.
RUNNABLE             Can be executed locally or in a safe environment.
DOCUMENTED           Current behavior has been documented.
BUSINESS_CONFIRMED   Business owner confirmed intended behavior.
TEST_COVERED         Has meaningful test or manual verification.
RISK_CLASSIFIED      Risk level and rollback path are known.
READY_FOR_CHANGE     Safe to modify in a bounded slice.
LOCKED_LEGACY        Must not change without explicit approval.
REPLACE_CANDIDATE    Candidate for gradual replacement.
RETIRED              Can be removed after confirmation.
```

Capability matrix template:

```markdown
# Capability Matrix

| Capability | Location | Current Behavior | State | Risk | Owner/Reviewer | Test/Baseline | Next Action |
|---|---|---|---|---|---|---|---|
```

## Baseline Verification

Baseline checks should prove the current system before change.

Minimum baseline:

- dependency install check;
- build or syntax check;
- existing tests, if any;
- app start or API start check, if possible;
- key route/API smoke check;
- environment variable inventory;
- known failure list.

Baseline report template:

```markdown
# Baseline Report

## Commands Run

## Results

## Passing Checks

## Failing Checks

## Known Existing Failures

## Environment Gaps

## Safe-To-Change Areas

## Frozen Areas
```

## Migration Roadmap

Migration should proceed by small slices:

```text
Slice 0: Document and baseline only; no behavior change.
Slice 1: Add tests around one low-risk workflow; no behavior change.
Slice 2: Add adapters/wrappers around fragile module; no behavior change.
Slice 3: Implement one low-risk improvement.
Slice 4: Replace or refactor one isolated module.
Slice 5: Touch core workflow only after baseline and rollback exist.
```

Roadmap template:

```markdown
# Migration Roadmap

## Strategy

## Freeze Zones

## Low-Risk Slices

## High-Risk Slices

## Replacement Candidates

## Required Business Confirmations

## Rollback Plan

## Next Three Slices
```

## Definition Of Done

Legacy Assimilation Mode is complete only when:

- safety check exists;
- inventory exists;
- As-Is architecture exists;
- recovered product contract exists;
- capability matrix exists;
- baseline report exists;
- migration roadmap exists;
- no major refactor was performed before baseline;
- frozen areas and safe-to-change areas are explicit.
