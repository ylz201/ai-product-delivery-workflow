# Project Memory

## Product Goal

Provide a reusable AI product delivery workflow skill that helps coding agents convert vague business ideas, PRD requests, vibe coding tasks, LLM application work, legacy project takeover, and half-built project recovery into controlled software delivery.

## Current Architecture

- Canonical workflow: `SKILL.md`
- Tool-specific entry points:
  - `.agents/skills/ai-product-delivery-workflow/SKILL.md`
  - `.claude/skills/ai-product-delivery-workflow/SKILL.md`
  - `.github/skills/ai-product-delivery-workflow/SKILL.md`
- Operating helper docs:
  - `AGENTS.md`
  - `CLAUDE.md`
  - `.github/copilot-instructions.md`
- References:
  - `references/legacy-project-assimilation.md`
  - `references/lightweight-memory-dashboard.md`
- Installation scripts:
  - `scripts/install-skill.sh`
  - `scripts/verify-install.sh`
  - `scripts/create-github-repo.sh`

## Important Decisions

- Keep v0.3.x lightweight before introducing v0.4 enterprise-level agent governance.
- Use file-based memory and static HTML dashboard before introducing databases, vector stores, or backend services.
- Treat v0.3 as the baseline and evaluate with controlled tasks before major expansion.
- Add legacy project assimilation as a patch rather than a full v0.4 redesign.

## Current Constraints

- The skill must remain usable across Codex, Claude Code, VS Code Agent Skills, and GitHub Copilot-style workflows.
- The workflow should avoid uncontrolled complexity.
- The agent must create/modify files when requested and verify results.
- Dashboard and memory must avoid storing secrets, credentials, private keys, tokens, or sensitive personal data.

## User Preferences

- Prefer practical, executable workflows over abstract agent theory.
- Prefer controlled evaluation before large architectural upgrades.
- Prefer lightweight, file-based, Git-trackable solutions before heavy infrastructure.
- Prefer visible process management: files changed, run records, risks, next actions, and project document map.

## Known Risks

- Skill bloat may make agents over-plan and under-execute.
- Without runnable dashboard files, v0.3.2 remains only a design reference.
- Static dashboards can accidentally centralize sensitive content if redaction is not enforced.
- Run records can become stale if agents do not update them after meaningful work.

## Things Never To Repeat

- Do not mark a feature complete based only on UI presence.
- Do not answer with only a plan when the user asked to create files.
- Do not introduce databases, vector stores, or cloud dashboards before file-based memory proves useful.
- Do not refactor a legacy project before baseline verification.

## Active Roadmap

1. v0.3 baseline: Master Agent, Chief Architect, Project Bootstrap, Recovery Takeover.
2. v0.3.1 legacy patch: old project assimilation, safety, inventory, baseline, migration roadmap.
3. v0.3.2 runnable patch: memory files, run records, static dashboard, generator script.
4. v0.4 candidate: agent registry, graph workflow, context budget, trace/eval/monitor, publish/rollback.
