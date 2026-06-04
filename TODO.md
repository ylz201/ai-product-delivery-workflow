# TODO: Controlled Evolution Roadmap

This roadmap prevents uncontrolled expansion of `ai-product-delivery-workflow`.

Principle: do not upgrade to v0.4 until v0.3 is evaluated with repeatable tasks and measurable results.

## Phase 0: Freeze Current v0.3

- [ ] Treat current `SKILL.md` v0.3 as baseline.
- [ ] Do not add v0.4 enterprise features directly to `main`.
- [ ] Create an evaluation branch before major changes.
- [ ] Keep all future changes tied to observed failure cases.

## Phase 1: Evaluate v0.3 With Three Controlled Tasks

### Task A: Fast Artifact Mode

Goal: verify that the skill stops planning-only behavior.

Test prompt:

```text
Use ai-product-delivery-workflow in Fast Artifact Mode.
Create docs/TEST_ARTIFACT.md with a short product delivery checklist.
Do not only explain. Create the file, verify it exists, and report paths and commands.
```

Pass criteria:

- [ ] File is created.
- [ ] Final answer includes file path.
- [ ] Final answer includes verification command.
- [ ] Agent does not only provide a plan.

### Task B: Project Bootstrap Mode

Goal: verify that v0.3 can turn an idea into a basic project scaffold.

Test prompt:

```text
Use ai-product-delivery-workflow in Project Bootstrap Mode.
Create a small MVP project for a visa order review workbench.
It should include docs/PRD.md, docs/TECH_DESIGN.md, README.md, .env.example, scripts/dev.sh, scripts/verify.sh, and a minimal runnable app scaffold.
```

Pass criteria:

- [ ] Project folder is created.
- [ ] Required docs exist.
- [ ] A first runnable scaffold exists.
- [ ] README explains install/dev/verify.
- [ ] scripts/verify.sh exists.
- [ ] Agent reports limitations instead of overclaiming.

### Task C: Recovery Takeover Mode

Goal: verify that v0.3 can inspect a half-built project and identify false-complete items.

Test prompt:

```text
Use ai-product-delivery-workflow in Recovery Takeover Mode.
Inspect this half-built project and classify each capability by completion level.
Find false-complete UI/API/data items and create docs/RECOVERY_PLAN.md.
```

Pass criteria:

- [ ] Agent inventories pages/routes/APIs/docs/tests.
- [ ] Capabilities are classified by completion level.
- [ ] False-complete items are identified.
- [ ] Recovery slice plan is created.

## Phase 2: Score v0.3

Score each test from 0 to 5.

| Metric | Meaning |
|---|---|
| Execution | Did it actually create/modify files? |
| Correct mode selection | Did it pick the right mode? |
| Artifact quality | Are outputs useful and structured? |
| Verification | Did it run or specify credible checks? |
| Anti-false-completion | Did it avoid overclaiming? |
| User control | Did it ask only necessary questions and expose risks? |

Decision rule:

- Average >= 4.2: v0.3 is usable for real projects.
- Average 3.5-4.1: use v0.3 but patch failure points only.
- Average < 3.5: do not expand; simplify and strengthen execution rules first.

## Phase 3: Only Then Consider v0.4

Do not add all v0.4 ideas at once.

Candidate v0.4 items must each map to a v0.3 failure:

- [ ] Agentic Suitability Gate
- [ ] Agent Registry
- [ ] Workflow Graph Contract
- [ ] Tool Permission Matrix
- [ ] Context Budget Contract
- [ ] Trace / Evaluation / Optimization Loop
- [ ] Publish / Monitor / Rollback Contract

## Phase 4: Safe Upgrade Rule

For each proposed v0.4 change:

```text
Observed failure:
Why v0.3 failed:
Proposed rule/template:
Expected benefit:
Evaluation case:
Rollback plan:
```

Only merge changes that improve evaluation scores or reduce repeated failures.
