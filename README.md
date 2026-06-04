# AI Product Delivery Workflow Skill

`ai-product-delivery-workflow` is an execution-oriented agent skill for PRD creation, vibe coding, LLM application delivery, AI agent workflow design, half-built project takeover, multi-agent review, QA gates, release handoff, and retrospective learning.

It is designed for use with:

- OpenAI Codex / VS Code compatible agents
- Claude Code
- GitHub Copilot Agent Skills in VS Code
- Cursor / Windsurf / Cline / Roo-style agent workflows, with adaptation

The core objective is to prevent two common AI coding failures:

1. beautiful planning without execution;
2. fast coding without a verifiable product contract.

## Repository Structure

```text
.
├── SKILL.md
├── AGENTS.md
├── CLAUDE.md
├── .agents/skills/ai-product-delivery-workflow/SKILL.md
├── .claude/skills/ai-product-delivery-workflow/SKILL.md
├── .github/skills/ai-product-delivery-workflow/SKILL.md
├── .github/copilot-instructions.md
├── skills/ai-product-delivery-workflow/SKILL.md
└── scripts/
    ├── install-skill.sh
    ├── verify-install.sh
    └── create-github-repo.sh
```

## Quick Install Into Current Project

From this repository directory:

```bash
./scripts/install-skill.sh project all /path/to/your-project
```

Install only for Codex / generic VS Code agents:

```bash
./scripts/install-skill.sh project codex /path/to/your-project
```

Install only for Claude Code:

```bash
./scripts/install-skill.sh project claude /path/to/your-project
```

Install only for GitHub Copilot Agent Skills:

```bash
./scripts/install-skill.sh project copilot /path/to/your-project
```

Verify installation:

```bash
./scripts/verify-install.sh /path/to/your-project
```

## User-Level Install

Install for all supported local agent paths:

```bash
./scripts/install-skill.sh user all
```

This installs to:

```text
~/.agents/skills/ai-product-delivery-workflow/SKILL.md
~/.claude/skills/ai-product-delivery-workflow/SKILL.md
~/.copilot/skills/ai-product-delivery-workflow/SKILL.md
```

## Manual Installation

### Codex / VS Code Compatible Agents

Copy:

```text
.agents/skills/ai-product-delivery-workflow/SKILL.md
```

to your project root:

```text
/path/to/your-project/.agents/skills/ai-product-delivery-workflow/SKILL.md
```

Optionally copy:

```text
AGENTS.md
```

to your project root.

### Claude Code

Copy:

```text
.claude/skills/ai-product-delivery-workflow/SKILL.md
```

to your project root:

```text
/path/to/your-project/.claude/skills/ai-product-delivery-workflow/SKILL.md
```

Optionally copy:

```text
CLAUDE.md
```

to your project root.

### GitHub Copilot / VS Code Agent Skills

Copy:

```text
.github/skills/ai-product-delivery-workflow/SKILL.md
```

to your project root:

```text
/path/to/your-project/.github/skills/ai-product-delivery-workflow/SKILL.md
```

Optionally copy:

```text
.github/copilot-instructions.md
```

to your project root.

## Direct Trigger Prompt

Use this prompt when an agent keeps planning but does not create files:

```text
Use ai-product-delivery-workflow in Fast Artifact Mode.

Do not stop after planning.

Inspect the current workspace, create or edit the requested file, verify it exists, and report:
1. files changed
2. commands run
3. verification result
4. blockers if any
```

## Push This Package To GitHub

With GitHub CLI:

```bash
cd ai-product-delivery-workflow-repo
./scripts/create-github-repo.sh ai-product-delivery-workflow private
```

For a public repo:

```bash
./scripts/create-github-repo.sh ai-product-delivery-workflow public
```

For an organization repo:

```bash
./scripts/create-github-repo.sh your-org/ai-product-delivery-workflow private
```

Without GitHub CLI:

```bash
cd ai-product-delivery-workflow-repo
git init
git add .
git commit -m "Initial ai product delivery workflow skill"
git branch -M main
git remote add origin git@github.com:<USER_OR_ORG>/ai-product-delivery-workflow.git
git push -u origin main
```

## Install From Your GitHub Repo After Publishing

After pushing the repo to GitHub, users can install by cloning:

```bash
git clone https://github.com/<USER_OR_ORG>/ai-product-delivery-workflow.git
cd ai-product-delivery-workflow
./scripts/install-skill.sh project all /path/to/target-project
```

Or download ZIP from GitHub:

```bash
curl -L https://github.com/<USER_OR_ORG>/ai-product-delivery-workflow/archive/refs/heads/main.zip -o ai-product-delivery-workflow.zip
```

## Completion Evidence Expected From Agents

Any agent using this skill should report:

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
- Test result:
- Browser QA result:
- File existence check:
- Known limitation:
```

## License

No open-source license is selected by default. Add MIT, Apache-2.0, or another license before publishing publicly if needed.
