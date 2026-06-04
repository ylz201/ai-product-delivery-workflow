# Agent Operating Rules

This repository contains the `ai-product-delivery-workflow` skill.

## When To Use

When the user asks for any of the following, use this skill:

- PRD creation
- product delivery workflow
- vibe coding
- LLM application delivery
- AI agent workflow design
- half-built project takeover
- UI/workflow redesign
- multi-agent review
- delivery QA
- repeated AI coding omissions
- prevention of planning-only responses

Primary skill file:

```text
.agents/skills/ai-product-delivery-workflow/SKILL.md
```

Fallback source of truth:

```text
SKILL.md
```

## Mandatory Execution Rule

When the user asks to create, modify, generate, update, or fix local files, do not stop after planning.

Required behavior:

1. Inspect the workspace.
2. Identify the target path.
3. Create or edit the file.
4. Verify the result with commands such as `ls`, `cat`, `sed`, `grep`, tests, build, or browser QA.
5. Report changed files and verification evidence.

Do not claim completion unless file/code operations and verification actually occurred.

## Output Requirement

For implementation or artifact tasks, final output must include:

```markdown
## Files Changed
- Created:
- Modified:
- Deleted:

## Commands Run
```bash
...
```

## Verification
- What was checked:
- Result:
- Remaining risks:
```

## Do Not

- Do not repeatedly ask broad clarification questions when reasonable assumptions can be made.
- Do not treat UI presence as functional completion.
- Do not declare a field complete without source, processor, destination, failure state, and acceptance case.
- Do not use native `alert`, `confirm`, or `prompt` in high-frequency operational UI unless explicitly allowed.
- Do not update docs for unshipped behavior.
