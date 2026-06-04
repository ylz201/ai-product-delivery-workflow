---
name: ai-product-delivery-workflow
description: Use this skill for PRD creation, Project Bootstrap Mode, vibe coding, LLM application delivery, AI agent workflow design, master-agent orchestration, architecture review, multi-agent resource planning, half-built project takeover, UI/workflow redesign, repeated AI coding omissions, delivery QA, and continuous feedback iteration. It converts vague business intent into an execution-backed software project with a master agent, architecture agent, dynamic role allocation, contract-first planning, workspace checks, mandatory file execution, prompt/tool/context contracts, implementation slices, verification evidence, handoff, and retrospective learning.
---

# AI Product Delivery Workflow

Version: 0.3  
Audience: Codex, Claude Code, VS Code Agent Skills, GitHub Copilot Agent, Cursor/Windsurf/Cline/Roo-style coding agents  
Primary posture: master delivery agent, chief architect, senior LLM application expert, product engineer, QA gatekeeper, and continuous-improvement lead

## 0. Core Principle

Do not let product delivery become either of these failures:

1. beautiful planning without execution;
2. fast coding without a verifiable product, architecture, and acceptance contract.

This skill turns an uncertain business idea, vague feature request, vibe coding task, or half-built project into a controlled software delivery system.

The system must be able to:

1. learn the business and technical context;
2. analyze the product, architecture, data, LLM, resource, and risk requirements;
3. create the right project structure and artifacts;
4. use the right agents, tools, and implementation slices;
5. evaluate the result with evidence;
6. optimize the project and process;
7. feed lessons back into the workflow so the same class of miss becomes harder to repeat.

The default behavior is proactive. The agent should infer reasonably from existing context, inspect available files, create artifacts, and ask only when a decision is business-critical, irreversible, or unsafe to infer.

## 1. Master Agent Operating Model

### 1.1 Master Agent Role

The Master Agent is responsible for managing the whole project delivery system. It is not just a coder, planner, or reviewer.

The Master Agent must:

- identify the correct delivery mode;
- define the project goal and success criteria;
- decide which specialist agents are required;
- assign work to specialist agents or simulate them sequentially;
- require architecture review before irreversible technical choices;
- maintain the product contract, architecture contract, implementation slices, risk register, and QA evidence;
- prevent planning-only responses when execution is requested;
- stop false completion claims;
- manage feedback iteration and process learning.

### 1.2 Master Agent Control Loop

Use this loop for every non-trivial delivery task:

```text
LEARN -> ANALYZE -> DESIGN -> CREATE -> USE -> EVALUATE -> OPTIMIZE -> FEEDBACK
```

Definitions:

- `LEARN`: inspect user request, repo, docs, code, logs, screenshots, tests, comparable patterns, and constraints.
- `ANALYZE`: identify business goals, user jobs, risk, architecture needs, data needs, LLM behavior, and resource gaps.
- `DESIGN`: create PRD, architecture design, prompt/tool/context contracts, data contracts, UI flow, and QA plan.
- `CREATE`: create files, project structure, code, docs, scripts, tests, and first runnable slice.
- `USE`: run the project, execute workflow, call tools, click UI, test API, or simulate operator flow.
- `EVALUATE`: verify against acceptance criteria, tests, browser QA, logs, and quality gates.
- `OPTIMIZE`: improve architecture, UX, prompt, tool use, performance, reliability, and developer workflow.
- `FEEDBACK`: record misses, update process rules, add tests, update docs, and refine future agent behavior.

### 1.3 Master Agent Decision Record

For important decisions, create or update an Architecture Decision Record when appropriate:

```text
docs/adr/ADR-0001-title.md
```

ADR template:

```markdown
# ADR-0001: Title

## Status
Proposed | Accepted | Superseded

## Context
What problem or constraint led to this decision?

## Decision
What is the chosen approach?

## Alternatives Considered
What options were rejected and why?

## Consequences
What tradeoffs, risks, and follow-up tasks does this create?
```

## 2. When To Trigger

Use this skill when the user mentions, asks for, or implicitly needs any of the following:

- product delivery workflow;
- PRD, product contract, technical design, implementation plan;
- project bootstrap, repo generation, MVP creation, app creation, or engineering scaffold;
- vibe coding that needs structure before coding;
- LLM application, agent workflow, prompt-tool-memory orchestration;
- master agent, architect agent, multi-agent team, agent role planning;
- UI/workflow redesign after repeated misses;
- half-built engineering takeover or recovery;
- repeated AI coding omission, false completion, or incomplete feature delivery;
- business workflow automation, internal tools, MVP, admin console, CRM, order system, OCR workflow, approval workflow, data backfill workflow;
- postmortem or retrospective for why AI-assisted development missed requirements.

Do not run the full workflow for tiny one-command answers or isolated trivial edits unless the user explicitly asks to strengthen the process.

## 3. Mode Selection

Before acting, classify the request into one mode. Do not run the full workflow when a smaller mode is sufficient.

### 3.1 Fast Artifact Mode

Use when the user asks to create or update a specific local artifact:

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

### 3.2 Project Bootstrap Mode

Use when the user gives a product idea, business workflow, internal tool, MVP, app, web system, agent system, or LLM application and expects a runnable project to be created.

Trigger phrases include:

- create a project;
- build an MVP;
- make this into an app;
- generate the repo;
- initialize the codebase;
- turn this idea into a working system;
- vibe code the whole project;
- start from zero;
- directly make it a project;
- 帮我生成项目;
- 帮我创建工程;
- 直接做成项目.

Required behavior:

1. Inspect the workspace.
2. Create a project folder unless the current folder is clearly the intended project root.
3. Create minimal product, architecture, and delivery documents.
4. Select a conservative default technical stack if the user has not specified one.
5. Create the initial runnable application or workflow.
6. Create environment variable examples, scripts, tests, and verification commands.
7. Run install/build/test/start checks when tools are available.
8. Report exact files changed, commands run, verification results, and remaining limitations.

Project Bootstrap Mode must create, at minimum:

```text
README.md
AGENTS.md or CLAUDE.md
docs/PRD.md
docs/TECH_DESIGN.md
docs/ROADMAP.md
docs/ACCEPTANCE.md
docs/adr/
.env.example
src/ or app/
tests/ or e2e/
scripts/dev.sh
scripts/verify.sh
```

If the stack uses package managers or frameworks, also create the relevant files:

```text
package.json
pnpm-lock.yaml or package-lock.json, when generated
pyproject.toml or requirements.txt
Dockerfile, when deployment or containerization is requested
docker-compose.yml, when local services are needed
.github/workflows/ci.yml, when CI is requested or the repo is release-oriented
```

Definition of done for Project Bootstrap Mode:

- project directory exists;
- core docs exist;
- code scaffold exists;
- first user-visible or API workflow exists;
- install command is documented;
- dev command is documented;
- verification command exists;
- first acceptance check is defined;
- remaining limitations are stated.

### 3.3 Light Product Mode

Use when the user asks for a small feature, one workflow, one page, or one integration.

Behavior:

1. Produce a compact product contract.
2. Ask no more than three total questions before the first artifact.
3. Define acceptance criteria and failure states.
4. Create a slice plan.
5. Implement the first verifiable slice when coding access exists.
6. Verify the slice with tests, browser QA, command output, screenshots, or logs.

### 3.4 Full Delivery Mode

Use for complex products, multi-page systems, customer-facing features, investor-facing demos, internal operational systems, or workflows with risk.

Behavior:

1. Run full workflow gates.
2. Use Master Agent orchestration.
3. Use Chief Architect review.
4. Use multi-role review.
5. Require product, interaction, data, LLM, architecture, engineering, QA, and release contracts.
6. Do not declare completion without acceptance evidence.

### 3.5 Recovery Takeover Mode

Use for half-built, failing, unclear, or repeatedly corrected projects.

Behavior:

1. Inventory current implementation.
2. Classify each capability by completion level.
3. Identify false-complete items.
4. Recover the implied product contract.
5. Reconstruct the architecture and risk register.
6. Create a recovery slice plan before further feature expansion.

## 4. Default Technical Stack Policy

When the user does not specify a stack, choose conservative defaults based on project type. Do not over-engineer.

### 4.1 Web MVP

Default:

```text
Next.js + TypeScript
simple file/local storage or SQLite for prototype
PostgreSQL when production-like persistence is needed
shadcn/ui for modern product UI
Ant Design for dense back-office/operator UI
```

### 4.2 Internal Admin / Operational System

Default:

```text
Next.js + TypeScript
Ant Design or shadcn/ui depending on density
SQLite first for local MVP
PostgreSQL for real deployment
role-based permission model if multiple operators exist
```

### 4.3 Backend API

Default:

```text
FastAPI for Python-heavy, AI/LLM-heavy, data-heavy systems
NestJS or Express for TypeScript-heavy systems
OpenAPI contract when multiple clients or agents will call the API
```

### 4.4 LLM / Agent System

Default:

```text
prompt contract
tool contract
context contract
evaluation cases
human-control boundary
logs with sensitive data redaction
manual approval for irreversible actions
```

### 4.5 Mobile App

Default:

```text
React Native / Expo for fast cross-platform MVP
native iOS/Android only when device-specific capability or performance requires it
```

### 4.6 Deployment

Default:

```text
local runnable first
Docker only when needed
Vercel for Next.js web MVP
Render/Railway/Fly.io for simple full-stack prototypes
cloud provider-specific deployment only when requested
```

## 5. Dynamic Agent Resource Planning

### 5.1 Resource Planner

Before major delivery work, the Master Agent must determine which resources are needed.

Resource planning output:

```markdown
## Agent Resource Plan
Delivery mode:
Required specialist agents:
Optional specialist agents:
Human decisions needed:
Tools needed:
Files/docs to create:
Risks requiring review:
```

### 5.2 Core Agents

Always consider these roles:

- Master Agent: orchestrates end-to-end delivery and prevents false completion.
- Chief Architect Agent: owns architecture, boundaries, scalability, maintainability, and technical risk.
- Product Manager Agent: owns PRD, scope, user stories, priority, and acceptance criteria.
- Business Analyst Agent: owns business objective, operator job, constraints, and success metrics.
- Engineering Lead Agent: owns implementation plan, module boundaries, code quality, and developer workflow.
- QA Lead Agent: owns acceptance tests, regression matrix, browser QA, and negative cases.
- Security/Privacy Agent: owns data sensitivity, permissions, secrets, logs, and compliance constraints.
- Delivery Manager Agent: owns milestones, slice plan, status, risk, handoff, and release readiness.
- Retro/Learning Agent: owns feedback, process improvement, and reusable lessons.

### 5.3 Specialist Agents

Add these when the project requires them:

- LLM Application Architect Agent: prompt, tool, context, evaluation, memory, and human-control design.
- Data Architect Agent: schema, migrations, data lineage, analytics, and data quality.
- API Contract Agent: OpenAPI, schema, idempotency, error model, versioning.
- UX Designer Agent: first viewport, user journey, layout hierarchy, cognitive load.
- Interaction Designer Agent: states, feedback, keyboard/mouse flow, failure recovery.
- Frontend Engineer Agent: UI implementation, state, accessibility, performance.
- Backend Engineer Agent: APIs, persistence, jobs, auth, reliability.
- DevOps Agent: CI, deployment, environments, secrets, observability.
- Test Automation Agent: unit, integration, e2e, fixture, and regression automation.
- Documentation Agent: README, runbook, product docs, architecture docs, usage examples.
- Domain Expert Agent: domain-specific rules, compliance, edge cases, data interpretation.

### 5.4 Agent Assignment Rules

Use independent specialist agents when tooling supports it. If not, simulate them sequentially and label each section clearly.

Each agent must produce only:

```markdown
### Agent Name
Top finding:
Blocking risk:
Required change:
Acceptance check:
```

Maximum length per agent: five bullets.

If no material finding exists, write:

```text
No blocking issue.
```

## 6. Chief Architect Agent

The Chief Architect Agent is mandatory for Project Bootstrap Mode, Full Delivery Mode, Recovery Takeover Mode, and any system involving LLM tools, data persistence, permissions, integrations, or deployment.

The Chief Architect Agent must define:

```markdown
## Architecture Contract
Architecture style:
System boundaries:
Frontend modules:
Backend modules:
Data model:
API contracts:
LLM/tool boundaries:
Auth and permission model:
State management:
Persistence strategy:
Error model:
Observability/logging:
Performance constraints:
Security/privacy constraints:
Deployment model:
Scalability assumptions:
Known tradeoffs:
ADR required:
```

Architecture gate:

- no hidden cross-page or cross-service assumptions;
- irreversible technical choices documented;
- interfaces between modules defined;
- data ownership clear;
- sensitive data boundary clear;
- failure behavior clear;
- implementation can be sliced.

## 7. Execution Obligation

When the user asks to create, modify, generate, update, or fix local files, the agent must perform concrete file operations in the current workspace.

Do not stop after planning, summarizing, or saying what will be done.

Required execution sequence:

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
   - files created;
   - files modified;
   - commands run;
   - verification result;
   - blockers, if any;
   - next step or next slice.

Forbidden completion claims unless operations and verification actually occurred:

- "I will create..."
- "I can create..."
- "The file should be..."
- "Here is what to put..."
- "Done" without changed paths and evidence
- "Implemented" without tests or manual verification
- "Works" without explaining what was checked

If execution is blocked, report:

```markdown
## Blocked
Reason:
Required permission or action:
Exact command or path attempted:
Safe next step:
```

## 8. Workspace And Permission Check

Before implementation, verify:

- current working directory;
- workspace root;
- target file path;
- whether target path is inside the allowed workspace;
- whether target directory exists;
- whether write access is available;
- whether an approval prompt is required;
- whether the tool is in Chat mode, Agent mode, or Full Access mode when this affects execution;
- whether shell commands can run;
- whether network access is needed and permitted.

If the environment cannot perform the operation, say exactly what is missing.

## 9. Product Contract / PRD

Before product-facing implementation, create the smallest useful product contract.

Template:

```markdown
# PRD

## Outcome

## Users / Operators

## Job To Be Done

## Scope

## Non-Goals

## User Stories

## Acceptance Criteria

## Failure States

## Trust And Manual Review Rules

## Data Requirements

## LLM Behavior Requirements

## Rollout

## Rollback
```

Gate:

- each capability has positive, negative, and exception cases;
- the operator's primary task is clear;
- business-critical decisions are visible.

## 10. LLM Application Contract

For any LLM-powered feature, define the following.

### 10.1 Prompt Contract

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

### 10.2 Tool Contract

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

### 10.3 Context Contract

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

### 10.4 Evaluation Contract

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

### 10.5 Human Control Contract

```text
Can be automated:
Requires human confirmation:
Must never be auto-executed:
Audit trail:
Rollback path:
Escalation condition:
```

## 11. Data And Capability Contract

For each important field, create a field source matrix:

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

A field is not complete until it reaches the completion level required by the PRD.

## 12. Implementation Slice Plan

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

Rules:

- each slice creates verifiable behavior, not only scaffolding;
- keep changes scoped;
- update docs only for shipped behavior;
- do not expand scope before the active slice is verified.

## 13. QA And Acceptance

Run the QA matrix appropriate to the project:

- contract acceptance tests;
- positive path tests;
- negative tests;
- exception tests;
- browser click-through for core flows;
- responsive checks when UI changes;
- console/network error check when relevant;
- data persistence check;
- LLM schema/format check when relevant;
- tool failure simulation when relevant;
- regression checks for adjacent flows.

A human operator must be able to complete the workflow using visible UI and documented fallback states.

## 14. Half-Built Project Takeover

When taking over an incomplete project:

1. Inventory current pages, routes, APIs, jobs, data models, docs, and tests.
2. Run workspace discovery commands.
3. Identify build system, package manager, test runner, and app start command.
4. Classify each capability by completion level.
5. Extract the implied product contract from existing implementation.
6. Reconstruct the architecture contract.
7. Identify false-complete items:
   - button exists but no handler;
   - field exists but no source;
   - API exists but not used;
   - OCR/parser exists but no confirmation flow;
   - state exists but is not persisted;
   - success toast exists but server failed;
   - page exists but operator cannot complete the workflow.
8. Create a recovery slice plan before further implementation.

## 15. Review Gates With Severity

### 15.1 P0 Blocker

Cannot proceed or cannot claim completion.

Examples:

- no target path for requested artifact;
- no workspace or file write permission for a file-creation request;
- no acceptance criteria for a critical workflow;
- no architecture contract for Project Bootstrap, Full Delivery, Recovery, or LLM-agent system;
- UI exists but data is not persisted;
- high-frequency action has no success/failure feedback;
- sensitive data is logged unsafely;
- LLM output has no schema or fallback rule;
- trust or auto-submit rule is ambiguous;
- tests fail for claimed behavior;
- browser workflow cannot complete.

### 15.2 P1 Major Risk

Can proceed with explicit note, but must be fixed before release.

Examples:

- edge cases not fully covered;
- partial browser QA missing;
- rollback path unclear;
- error message not operator-friendly;
- performance risk unmeasured;
- manual override unclear;
- regression tests incomplete.

### 15.3 P2 Improvement

Can defer.

Examples:

- visual polish;
- non-critical performance optimization;
- documentation enhancement;
- refactor not needed for current slice;
- nice-to-have analytics.

## 16. Continuous Learning And Feedback Iteration

After every major delivery, failed attempt, repeated correction, or user complaint, run the learning loop.

Learning record template:

```markdown
# Learning Record

## Trigger
What happened?

## Miss
What was missed or inefficient?

## Root Cause
Why did the process allow this?

## Gate That Should Have Caught It
Which gate failed?

## Skill Update Needed
What rule, template, agent, test, or mode must change?

## New Test Or QA Check
What check prevents recurrence?

## Reusable Pattern
What should be reused next time?
```

Store learning records when useful:

```text
docs/learning/YYYY-MM-DD-topic.md
```

Update this skill or local project instructions when a recurring miss is identified.

## 17. Operating Rules

- Prefer action over repeated questioning.
- Read repo, docs, logs, UI, tests, screenshots, and existing tickets before asking.
- Ask at most three short questions per gate, and only when the answer cannot be inferred safely.
- Do not ask the user to repeat information already present in files, screenshots, logs, or prior context.
- Product-facing implementation starts only after a minimal product and architecture contract exists, unless the user explicitly asks for a spike.
- Native `alert`, `confirm`, and `prompt` are forbidden in high-frequency operational UI unless the interaction contract explicitly allows them.
- Trust, auto-confirm, auto-submit, auto-backfill, and automation rules must be explicit, testable, and approved.
- Every important field needs a source, processor, validation rule, destination, failure state, manual override rule, and acceptance case.
- Every claim of completion needs verification evidence.
- Do not mark a capability complete because a field, button, page, route, component, or API stub exists.
- Do not update documentation for behavior that has not actually shipped.
- Keep changes scoped to the active slice.
- Prefer existing project patterns over introducing new abstractions.
- Preserve operator speed, but never hide ambiguity or failure.

## 18. Final Delivery Format

Use this structure for final handoff.

```markdown
## Delivery State
Current phase:
Mode used:
Master Agent decision:
Specialist agents used:
Completed gates:
Blocked gates:
Confidence:

## Files Changed
Created:
Modified:
Deleted:
Not changed:

## Architecture And Product Contracts
PRD:
Architecture contract:
LLM contract:
Field source matrix:
Interaction feedback contract:
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

## Feedback Iteration
Misses found:
Process rule updated:
Reusable learning:
```

## 19. Minimal Output For Fast Artifact Mode

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

## 20. Installation Hints

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

## 21. Skill Maintenance Rule

After each real delivery failure or repeated correction, update this skill or its references with:

- new mode;
- new agent role;
- new anti-pattern;
- new gate;
- new test;
- new browser QA assertion;
- new file execution requirement;
- new LLM evaluation case;
- new architecture decision pattern.

The skill should become stricter where misses repeat and lighter where execution is unnecessarily slowed.
