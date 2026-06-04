---
name: ai-product-delivery-workflow
description: Use this skill for PRD creation, vibe coding, LLM application delivery, AI agent workflow design, multi-agent review, half-built project takeover, UI/workflow redesign, repeated AI coding omissions, and delivery QA. It converts vague business intent into an execution-backed product delivery process with contract-first planning, mode selection, workspace checks, mandatory file execution when requested, LLM prompt/tool/context contracts, review gates, implementation slices, verification evidence, handoff, and retro learning.
---

# AI Product Delivery Workflow

This repository-level skill entry is optimized for Codex and generic VS Code-compatible agents.

For the full canonical workflow, use the root `SKILL.md` in this repository as the source of truth.

## Mandatory Activation

Use this skill when the user asks for:

- PRD creation
- vibe coding
- LLM application delivery
- AI agent workflow design
- product delivery workflow
- multi-agent review
- half-built project takeover
- UI/workflow redesign
- repeated AI coding omission prevention
- delivery QA and release handoff

## Mode Selection

Classify the task first:

- Fast Artifact Mode: create or edit a specific file such as `SKILL.md`, `AGENTS.md`, `CLAUDE.md`, README, config, script, or template.
- Light Product Mode: one feature, page, workflow, or integration.
- Full Delivery Mode: complex product, multi-page system, or critical workflow.
- Recovery Takeover Mode: half-built, failing, unclear, or repeatedly corrected project.

## Execution Obligation

When the user asks to create, modify, generate, update, or fix local files, do not stop after planning.

Required sequence:

1. Inspect workspace with `pwd` and `ls -la`.
2. Identify the exact target path.
3. Create or edit the file.
4. Verify with `ls`, `cat`, `sed`, `grep`, tests, build, or browser QA.
5. Report changed paths, commands run, verification result, and blockers if any.

Forbidden completion claims:

- "I will create..."
- "I can create..."
- "Here is what to put..."
- "Done" without file path and verification evidence.

## Product Contract Before Product-Facing Implementation

Before product-facing coding, define at minimum:

```markdown
Outcome:
Operator/user:
Scope:
Non-goals:
Acceptance criteria:
Failure states:
Trust/manual review rules:
Data requirements:
```

For LLM features, also define:

```markdown
Prompt contract:
Tool contract:
Context contract:
Evaluation contract:
Human-control contract:
```

## Field Completion Rule

A field or feature is not complete because it is visible in the UI.

Track completion level:

- CONTRACTED
- UI_PRESENT
- DATA_ACCEPTED
- SERVER_PROCESSED
- FIELD_BACKFILLED
- DECISION_BOUNDED
- ACCEPTANCE_TESTED
- BROWSER_VERIFIED
- DOCS_UPDATED
- RELEASE_READY

Every important field requires:

```text
Field:
Source:
Processor:
Validation:
Confidence rule:
Destination:
Backfill behavior:
Failure behavior:
Manual override:
Audit/log requirement:
Acceptance cases:
Required completion level:
```

## Review Gates

P0 blockers prevent completion:

- no target path for requested artifact
- no workspace or write permission
- no acceptance criteria for critical workflow
- UI exists but data is not persisted
- high-frequency action has no success/failure feedback
- sensitive data is logged unsafely
- LLM output has no schema/fallback rule
- tests fail for claimed behavior
- browser workflow cannot complete

P1 risks can proceed with explicit note but must be fixed before release.

P2 improvements can defer.

## Final Output

For artifact tasks:

```markdown
Created/modified:
- path/to/file

Verified with:
- command

Result:
- concise summary

Notes:
- limitation or next step
```

For delivery tasks:

```markdown
## Delivery State
Mode:
Completed gates:
Blocked gates:
Confidence:

## Files Changed
Created:
Modified:
Deleted:

## Verification
Commands run:
Tests:
Browser QA:
What evidence proves:

## Risks And Open Decisions
P0:
P1:
P2:

## Next Slice
...
```
