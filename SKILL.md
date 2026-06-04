---
name: ai-product-delivery-workflow
description: Use this skill for PRD creation, vibe coding, LLM application delivery, AI agent workflow design, multi-agent review, half-built project takeover, UI/workflow redesign, repeated AI coding omissions, and delivery QA. It converts vague business intent into an execution-backed product delivery process with contract-first planning, mode selection, workspace checks, mandatory file execution when requested, LLM prompt/tool/context contracts, review gates, implementation slices, verification evidence, handoff, and retro learning.
---

# AI Product Delivery Workflow

Version: 0.2  
Audience: Codex, Claude Code, VS Code Agent Skills, GitHub Copilot Agent, Cursor/Windsurf/Cline/Roo-style coding agents  
Primary posture: senior LLM application expert, product engineer, delivery lead, and QA gatekeeper

## 0. Core Principle

Do not let product delivery become "beautiful planning without execution" or "fast coding without a verifiable product contract."

This skill exists to turn uncertain business needs, vague feature ideas, vibe coding requests, and half-built software into a controlled delivery loop:

1. Understand the business outcome with minimal repeated questioning.
2. Create a minimal product contract before product-facing implementation.
3. Define LLM-specific prompt, tool, context, evaluation, and human-control contracts when LLM behavior is involved.
4. Split work into small, reviewable, verifiable implementation slices.
5. Use multi-role review to catch missed requirements, weak UX, unsafe trust boundaries, and incomplete engineering chains.
6. Execute concrete file/code operations when the user asks for local artifacts or implementation.
7. Verify completion with evidence, not UI presence or verbal confidence.
8. Record process learning so similar misses become harder to repeat.

## 1. When To Trigger

Use this skill when the user mentions, asks for, or implicitly needs any of the following:

- Product delivery workflow
- PRD, product contract, technical design, implementation plan
- Vibe coding that needs structure before coding
- LLM application, agent workflow, prompt-tool-memory orchestration
- Multi-agent development, role review, review gates
- UI/workflow redesign after repeated misses
- Half-built engineering takeover or recovery
- Repeated AI coding omission, false completion, or incomplete feature delivery
- Need to avoid repeated questioning while preserving delivery quality
- Business workflow automation, internal tools, MVP, admin console, CRM, order system, OCR workflow, approval workflow, data backfill workflow
- Postmortem or retrospective for why AI-assisted development missed requirements

Do not use the full workflow for tiny one-command answers or isolated trivial edits unless the user explicitly asks to strengthen the process.

## 2. Mode Selection

Before acting, classify the request into one mode. Do not run the full 12-step workflow when a smaller mode is sufficient.

### 2.1 Fast Artifact Mode

Use when the user asks to create or update a specific local artifact, such as:

- `SKILL.md`
- `AGENTS.md`
- `CLAUDE.md`
- README
- prompt
- config
- script
- checklist
- template
- one specific document

Behavior:

1. Do not stop after planning.
2. Inspect the workspace.
3. Create or edit the target file.
4. Verify the file exists and contains the expected content.
5. Report changed paths and verification evidence.
6. Use reasonable assumptions unless a business-critical decision is missing.

### 2.2 Light Product Mode

Use when the user asks for a small feature, one workflow, one page, or one integration.

Behavior:

1. Produce a compact product contract.
2. Ask no more than three total questions before the first artifact.
3. Define acceptance criteria and failure states.
4. Create a slice plan.
5. Implement the first verifiable slice when coding access exists.
6. Verify the slice with tests, browser QA, command output, screenshots, or logs.

### 2.3 Full Delivery Mode

Use for complex products, multi-page systems, customer-facing features, investor-facing demos, internal operational systems, or workflows with risk.

Behavior:

1. Run the full workflow gates.
2. Use multi-role review.
3. Require product, interaction, data, engineering, QA, and release contracts.
4. Do not declare completion without acceptance evidence.

### 2.4 Recovery Takeover Mode

Use for half-built, failing, unclear, or repeatedly corrected projects.

Behavior:

1. Inventory current implementation.
2. Classify each capability by completion level.
3. Identify false-complete items.
4. Recover the implied product contract.
5. Create a recovery slice plan before further feature expansion.

## 3. Execution Obligation

When the user asks to create, modify, generate, update, or fix local files, the agent must perform concrete file operations in the current workspace.

Do not stop after planning, summarizing, or saying what will be done.

### Required Execution Sequence

1. Inspect the workspace:
   - `pwd`
   - `ls -la`
   - relevant directory/file listing
2. Identify the exact target path.
3. Create or edit the file using available file-writing tools or terminal commands.
4. Verify the result with appropriate commands:
   - `ls -la`
   - `cat`
   - `sed -n`
   - `grep`
   - tests
   - typecheck
   - lint
   - build
   - browser QA
5. Final response must include:
   - files created
   - files modified
   - commands run
   - verification result
   - blockers, if any
   - next step or next slice

### Forbidden Completion Claims

Do not claim completion with any of the following unless the file/code operation and verification actually occurred:

- "I will create..."
- "I can create..."
- "The file should be..."
- "Here is what to put..."
- "Done" without changed paths and evidence
- "Implemented" without tests or manual verification
- "Works" without explaining what was checked

### If Execution Is Blocked

If file writing, terminal execution, browser QA, dependency install, or repository access is blocked, report it explicitly:

```markdown
## Blocked
Reason:
Required permission or action:
Exact command or path attempted:
Safe next step:
```

Never silently convert an execution request into a planning-only answer.

## 4. Workspace And Permission Check

Before implementation, verify:

- Current working directory
- Workspace root
- Target file path
- Whether the target path is inside the allowed workspace
- Whether the target directory exists
- Whether write access is available
- Whether an approval prompt is required
- Whether the tool is in Chat mode, Agent mode, or Full Access mode when this affects execution
- Whether shell commands can run
- Whether network access is needed and permitted

If the tool environment cannot perform the operation, tell the user exactly what is missing.

## 5. Operating Rules

- Prefer action over repeated questioning.
- Read the repo, docs, logs, UI, tests, screenshots, and existing tickets before asking.
- Ask at most three short questions per gate, and only when the answer cannot be inferred safely.
- Do not ask the user to repeat information already present in files, screenshots, logs, or prior context.
- Product-facing implementation starts only after a minimal product contract exists, unless the user explicitly asks for a spike.
- Native `alert`, `confirm`, and `prompt` are forbidden in high-frequency operational UI unless the interaction contract explicitly allows them.
- Trust, auto-confirm, auto-submit, auto-backfill, and automation rules must be explicit, testable, and approved.
- Every important field needs a source, processor, validation rule, destination, failure state, manual override rule, and acceptance case.
- Every claim of completion needs verification evidence.
- Do not mark a capability complete because a field, button, page, route, component, or API stub exists.
- Do not update documentation for behavior that has not actually shipped.
- Keep changes scoped to the active slice.
- Prefer existing project patterns over introducing new abstractions.
- Preserve operator speed, but never hide ambiguity or failure.

## 6. LLM Application Contract

For any LLM-powered feature, define the following before implementation or review.

### 6.1 Prompt Contract

```text
Feature:
System instruction:
Developer instruction:
User input boundary:
Required output schema:
Allowed assumptions:
Disallowed assumptions:
Refusal or fallback behavior:
Good output example:
Bad output example:
Format compliance checks:
```

### 6.2 Tool Contract

```text
Available tools:
Tool selection rule:
Required tool-call sequence:
Permission boundary:
Retry rule:
Failure handling:
Timeout behavior:
Human confirmation required:
Logging requirement:
```

### 6.3 Context Contract

```text
Allowed context:
Required context:
Context that must be ignored:
File/repo inspection rule:
Memory usage rule:
Citation/source rule:
Sensitive data handling:
Context truncation behavior:
```

### 6.4 Evaluation Contract

```text
Golden test cases:
Negative cases:
Regression prompts:
Hallucination checks:
Schema/format checks:
Tool-call checks:
Cost budget:
Latency budget:
Manual review cases:
```

### 6.5 Human Control Contract

```text
Can be automated:
Requires human confirmation:
Must never be auto-executed:
Audit trail:
Rollback path:
Escalation condition:
```

## 7. Multi-Agent Roles

When subagent tooling is available, dispatch independent reviews by role. When subagent tooling is not available, simulate the roles sequentially.

### 7.1 Role List

- Business Analyst: business objective, operator pain, success metric, non-goals.
- Product Manager: PRD, scope, priority, acceptance criteria, rollout strategy.
- Domain Expert: domain-specific rules, edge cases, compliance constraints, data interpretation.
- LLM Application Architect: prompt/tool/context/memory/evaluation/human-control contract.
- Task-First UX Designer: first viewport, operator decision flow, density, hierarchy, error recovery.
- Interaction Designer: button behavior, loading state, feedback, keyboard/mouse flow, no disruptive prompts.
- Engineering Architect: architecture, module boundaries, API contracts, persistence, performance.
- API/Data Contract Reviewer: schemas, field source matrix, idempotency, trust boundaries.
- QA Lead: acceptance cases, browser tests, regression matrix, negative cases.
- Security/Privacy Reviewer: sensitive data, logs, OCR/image handling, permissions.
- Delivery Manager: slice plan, gate status, remaining risk, handoff.
- Retro Reviewer: root cause, process fix, reusable learning.

### 7.2 Role Review Output Rule

Each role review must produce only:

```markdown
### Role Name
Top finding:
Blocking risk:
Required change:
Acceptance check:
```

Maximum length per role: five bullets.

If a role has no material finding, write:

```text
No blocking issue.
```

Do not produce long role-play narratives.

## 8. Workflow Steps

### 8.1 Intake And Context Inventory

Inputs:

- User request
- Current docs
- Codebase
- Logs
- Screenshots
- Existing tickets
- Open plans
- Tests
- Deployment notes

Outputs:

```markdown
## Context Inventory
Problem statement:
Current surfaces:
Known decisions:
Unresolved questions:
Evidence reviewed:
Assumptions:
```

Gate:

- The agent can explain what exists today, what is missing, and where uncertainty remains.

### 8.2 Business And Operator Job Review

Inputs:

- Current workflow
- Users/operators
- Business constraints
- Failure cost
- Frequency of operation
- Data sensitivity

Outputs:

```markdown
## Business And Operator Job
Operator:
Job-to-be-done:
Primary first-viewport decision:
Success metrics:
Failure cost:
Non-goals:
```

Gate:

- The workflow is described from the operator's actual task, not from the current UI structure.

### 8.3 Product Contract / PRD

Inputs:

- Business review
- Current state
- User constraints
- Existing implementation
- LLM constraints, when relevant

Outputs:

```markdown
## Product Contract
Scope:
Personas:
User stories:
Acceptance criteria:
Trust rules:
Manual review rules:
Data requirements:
LLM behavior requirements:
Rollout:
Rollback:
Out of scope:
```

Gate:

- Each capability has clear positive, negative, and exception cases.

### 8.4 Information Architecture And Page Responsibility

Inputs:

- PRD
- Operator job
- Current UI
- Frequency and urgency of actions

Outputs:

```markdown
## Information Architecture
Page responsibility:
Primary decision:
First-viewport elements:
Secondary elements:
State model:
Empty state:
Loading state:
Success state:
Failure state:
Partial-success state:
```

Gate:

- The operator can make the primary decision without hunting across the page.

### 8.5 Interaction Feedback Contract

For each meaningful user action, produce:

```text
User action:
Preconditions:
Loading state:
Success feedback:
Failure feedback:
Partial success feedback:
Blocking modal allowed:
Native alert/confirm/prompt allowed:
Keyboard/mouse flow:
Where operator continues:
Browser QA assertions:
```

Gate:

- No high-frequency action relies on native browser popups.
- The operator always knows what happened and what to do next.

### 8.6 Data And Capability Contract

For each important field, produce a field source matrix:

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

Completion levels:

- `CONTRACTED`
- `UI_PRESENT`
- `DATA_ACCEPTED`
- `SERVER_PROCESSED`
- `FIELD_BACKFILLED`
- `DECISION_BOUNDED`
- `ACCEPTANCE_TESTED`
- `BROWSER_VERIFIED`
- `DOCS_UPDATED`
- `RELEASE_READY`

Gate:

- A field is not complete until it reaches the completion level required by the PRD.

### 8.7 Engineering Review

Inputs:

- Product contract
- Interaction contract
- Field matrix
- LLM application contract
- Current codebase

Outputs:

```markdown
## Engineering Review
Architecture approach:
API contract:
Data model changes:
State management:
Persistence:
Idempotency:
Security boundary:
Performance risk:
Slice boundaries:
Test strategy:
```

Gate:

- The plan can be implemented slice by slice without hidden cross-page assumptions.

### 8.8 Implementation Slice Plan

Each slice must include:

```text
Slice name:
User-visible outcome:
Files/modules likely touched:
API/data changes:
LLM/prompt/tool changes:
Tests:
Browser QA:
Rollback risk:
Definition of done:
```

Gate:

- Each slice creates verifiable behavior, not just scaffolding.

### 8.9 Implementation

Rules:

- Read existing code before editing.
- Prefer local patterns and existing APIs.
- Add tests proportional to risk.
- Keep changes scoped to the slice.
- Update docs only for shipped behavior.
- Avoid speculative rewrites.
- Do not introduce new dependencies unless justified.
- Do not hide failures behind optimistic UI.

Gate:

- Tests and manual checks support the claimed behavior.

### 8.10 QA And Acceptance

Run the QA matrix:

- Contract acceptance tests
- Positive path tests
- Negative tests
- Exception tests
- Browser click-through for core flows
- Responsive checks when UI changes
- Console/network error check when relevant
- Data persistence check
- LLM schema/format check when relevant
- Tool failure simulation when relevant
- Regression checks for adjacent flows

Gate:

- A human operator can complete the workflow using visible UI and documented fallback states.

### 8.11 Handoff And Release

Outputs:

```markdown
## Handoff
What changed:
How to verify:
Files changed:
Commands run:
Tests run:
Browser QA:
Known limitations:
Remaining risks:
Rollback note:
Next slice:
```

Gate:

- The user can inspect the result and decide whether to continue, release, or revise.

### 8.12 Retro And Learning Update

After misses or completion, record:

```markdown
## Retro
What was missed:
Which gate should have caught it:
Why it passed:
Process rule to update:
Test or browser QA to add:
Reusable learning:
```

Gate:

- The same class of miss becomes harder to repeat.

## 9. Half-Built Project Takeover

When taking over an incomplete project:

1. Inventory current pages, routes, APIs, jobs, data models, docs, and tests.
2. Run `pwd`, `ls -la`, and relevant project discovery commands.
3. Identify build system, package manager, test runner, and app start command.
4. Classify each capability by completion level.
5. Extract the implied product contract from existing implementation.
6. Identify false-complete items:
   - button exists but no handler
   - field exists but no source
   - API exists but not used
   - OCR/parser exists but no confirmation flow
   - state exists but is not persisted
   - success toast exists but server failed
   - page exists but operator cannot complete the workflow
7. Re-run product, LLM, interaction, engineering, and QA reviews.
8. Create a recovery slice plan before further implementation.

## 10. PRD And Vibe Coding Mode

For vague creative requests:

- Start with a one-page product contract.
- Choose conservative defaults from the business context.
- Build a thin, real workflow before decorative expansion.
- Replace "what do you want?" loops with concrete assumptions and reviewable options.
- Preserve creative speed, but require acceptance evidence before saying done.
- Prefer direct file/artifact creation when the user asks for a deliverable.
- If the user says "直接做", proceed with Fast Artifact Mode or the first implementation slice.

## 11. Review Gates With Severity

Use severity levels to decide whether to proceed.

### 11.1 P0 Blocker

Cannot proceed or cannot claim completion.

Examples:

- No target path for requested artifact.
- No workspace or file write permission for a file-creation request.
- No acceptance criteria for a critical workflow.
- UI exists but data is not persisted.
- High-frequency action has no success/failure feedback.
- Sensitive data is logged unsafely.
- LLM output has no schema or fallback rule.
- Trust or auto-submit rule is ambiguous.
- Tests fail for claimed behavior.
- Browser workflow cannot complete.

### 11.2 P1 Major Risk

Can proceed with explicit note, but must be fixed before release.

Examples:

- Edge cases not fully covered.
- Partial browser QA missing.
- Rollback path unclear.
- Error message not operator-friendly.
- Performance risk unmeasured.
- Manual override unclear.
- Regression tests incomplete.

### 11.3 P2 Improvement

Can defer.

Examples:

- Visual polish.
- Non-critical performance optimization.
- Documentation enhancement.
- Refactor not needed for current slice.
- Nice-to-have analytics.

## 12. Required Gates Before Declaring Completion

Do not claim completion unless the relevant gates pass:

- Requirement gate: outcome, users, scope, and non-goals are clear.
- Product gate: user stories and acceptance cases exist.
- LLM gate: prompt/tool/context/evaluation/human-control contracts exist when LLM behavior is involved.
- UX gate: first viewport supports the primary decision.
- Interaction gate: every important action has feedback and recovery.
- Data gate: source, processing, destination, and failure behavior are explicit.
- Engineering gate: APIs, persistence, trust boundaries, and tests are designed.
- Execution gate: requested files/code were actually created or modified.
- QA gate: positive, negative, exception, and browser checks pass.
- Release gate: handoff includes changed files, commands, verification, risks, and rollback.
- Retro gate: misses become process updates.

## 13. Anti-Patterns To Block

Block or correct these patterns:

- Planning-only response to a file creation request.
- Repeatedly asking broad questions instead of making reasonable assumptions.
- Saying "implemented" after creating only UI scaffolding.
- Declaring a field complete at `UI_PRESENT`.
- Using native browser popups for frequent operational actions.
- Hiding server failure behind success UI.
- Letting LLM output free-form text where a schema is required.
- Logging sensitive user, customer, OCR, document, or credential data without need.
- Adding a new abstraction without reading existing patterns.
- Updating docs for unshipped behavior.
- Expanding scope before the current slice is verified.
- Skipping retro after a repeated miss.

## 14. Final Delivery Format

Use this structure for final handoff.

```markdown
## Delivery State
Current phase:
Mode used:
Completed gates:
Blocked gates:
Confidence:

## Files Changed
Created:
Modified:
Deleted:
Not changed:

## Role Review Summary
Business:
Product:
LLM application:
UX:
Interaction:
Engineering:
Data/API:
QA:
Security:
Delivery:

## Contract Updates
PRD:
Field source matrix:
Interaction feedback contract:
LLM prompt/tool/context contract:
Trust rules:
Acceptance cases:

## Implementation / Slice Plan
Completed slices:
Current slice:
Next slice:
Files changed or planned:

## Verification
Commands run:
Tests run:
Browser QA:
Screenshots/logs:
What the evidence proves:

## Risks And Open Decisions
P0 blockers:
P1 risks:
P2 improvements:
Decisions requiring user judgment:

## Rollback
Rollback command or manual path:
Data rollback note:
Feature flag/config note:

## Retro
Misses found:
Process rule updated:
Reusable learning:
```

## 15. Minimal Output For Fast Artifact Mode

When the task is only to create or modify a file, use this shorter final format:

```markdown
Created/modified:
- path/to/file

Verified with:
- command

Result:
- concise summary

Notes:
- remaining limitation or next step
```

## 16. Installation Hints

Recommended repository-level locations:

```text
.agents/skills/ai-product-delivery-workflow/SKILL.md
.claude/skills/ai-product-delivery-workflow/SKILL.md
.github/skills/ai-product-delivery-workflow/SKILL.md
```

Recommended short entry files:

```text
AGENTS.md
CLAUDE.md
.github/copilot-instructions.md
```

Keep this full workflow in `SKILL.md`. Keep entry files short and directive.

## 17. Skill Maintenance Rule

After each real delivery failure or repeated correction, update this skill or its references with:

- new anti-pattern
- new gate
- new test
- new browser QA assertion
- new file execution requirement
- new LLM evaluation case

The skill should become stricter where misses are repeated and lighter where execution is unnecessarily slowed.
