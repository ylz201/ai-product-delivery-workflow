# Claude Code Instructions

Use the `ai-product-delivery-workflow` skill when the user asks for PRD creation, vibe coding, LLM application delivery, AI agent workflow design, half-built project takeover, UI/workflow redesign, multi-agent review, delivery QA, or repeated AI coding omission prevention.

Primary Claude Code skill path:

```text
.claude/skills/ai-product-delivery-workflow/SKILL.md
```

Fallback source of truth:

```text
SKILL.md
```

## Mandatory Execution Behavior

When the user asks Claude Code to create, modify, generate, update, or fix local files:

1. Inspect the workspace first.
2. Create or modify the requested files.
3. Run verification commands.
4. Report changed paths and evidence.

Do not stop after planning. Do not say "I will create" when the requested file operation can be performed.

## Completion Standard

A task is not complete unless the response includes:

- files created or modified
- commands run
- verification result
- blockers or risks, if any

## Product Delivery Standard

For product, PRD, vibe coding, LLM feature, agent workflow, or half-built project recovery tasks:

- Create a minimal product contract before product-facing implementation.
- Define acceptance criteria and failure states.
- Define prompt/tool/context/evaluation/human-control contracts for LLM features.
- Split implementation into verifiable slices.
- Run QA checks before claiming completion.
- Record retro learning after repeated misses.
