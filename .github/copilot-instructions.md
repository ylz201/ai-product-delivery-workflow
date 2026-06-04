# GitHub Copilot / VS Code Agent Instructions

Use the `ai-product-delivery-workflow` skill for product delivery, PRD creation, vibe coding, LLM application delivery, AI agent workflow design, half-built project takeover, UI/workflow redesign, multi-agent review, QA gates, and repeated AI coding omission prevention.

Primary skill path:

```text
.github/skills/ai-product-delivery-workflow/SKILL.md
```

Fallback source of truth:

```text
SKILL.md
```

## Execution Requirement

When the user asks to create or modify a file, do not provide only a plan. Create or edit the file, verify it exists, and report the changed path and verification command.

## Completion Requirement

For implementation work, report:

- files changed
- commands run
- tests or checks performed
- browser QA, if relevant
- known limitations

Do not claim completion based only on UI presence, scaffolded components, or verbal confidence.
