#!/usr/bin/env bash

set -euo pipefail

# Install ai-product-delivery-workflow skill.
#
# Usage:
#   bash scripts/install-skill.sh project all /path/to/project
#   bash scripts/install-skill.sh project codex /path/to/project
#   bash scripts/install-skill.sh project claude /path/to/project
#   bash scripts/install-skill.sh project copilot /path/to/project
#   bash scripts/install-skill.sh user all
#
# Modes:
#   all     Install Codex/.agents, Claude Code, and GitHub Copilot paths.
#   codex   Install .agents/skills path and AGENTS.md helper when safe.
#   claude  Install .claude/skills path and CLAUDE.md helper when safe.
#   copilot Install .github/skills path and copilot-instructions helper when safe.

TARGET_TYPE=${1:-}
MODE=${2:-}
TARGET_PATH=${3:-}

usage() {
  echo "Usage: $0 [project|user] [all|codex|claude|copilot] /path/to/project"
  echo "For user install: $0 user [all|codex|claude|copilot]"
}

if [[ -z "$TARGET_TYPE" || -z "$MODE" ]]; then
  usage
  exit 1
fi

if [[ "$TARGET_TYPE" != "project" && "$TARGET_TYPE" != "user" ]]; then
  echo "ERROR: target type must be project or user."
  usage
  exit 1
fi

if [[ "$MODE" != "all" && "$MODE" != "codex" && "$MODE" != "claude" && "$MODE" != "copilot" ]]; then
  echo "ERROR: mode must be all, codex, claude, or copilot."
  usage
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_SOURCE="$SOURCE_DIR/SKILL.md"

if [[ ! -f "$SKILL_SOURCE" ]]; then
  echo "ERROR: Cannot find SKILL.md at $SKILL_SOURCE"
  exit 1
fi

if [[ "$TARGET_TYPE" == "user" ]]; then
  INSTALL_BASE="$HOME"
else
  if [[ -z "$TARGET_PATH" ]]; then
    echo "ERROR: project install requires a target project path."
    usage
    exit 1
  fi
  INSTALL_BASE="$TARGET_PATH"
fi

safe_copy_if_missing() {
  local source_file="$1"
  local target_file="$2"

  if [[ ! -f "$source_file" ]]; then
    return 0
  fi

  if [[ -f "$target_file" ]]; then
    echo "Skipped existing helper file: $target_file"
  else
    mkdir -p "$(dirname "$target_file")"
    cp "$source_file" "$target_file"
    echo "Created helper file: $target_file"
  fi
}

install_codex() {
  local target_dir="$INSTALL_BASE/.agents/skills/ai-product-delivery-workflow"
  mkdir -p "$target_dir"
  cp "$SKILL_SOURCE" "$target_dir/SKILL.md"
  echo "Installed Codex/.agents skill: $target_dir/SKILL.md"

  if [[ "$TARGET_TYPE" == "project" ]]; then
    safe_copy_if_missing "$SOURCE_DIR/AGENTS.md" "$INSTALL_BASE/AGENTS.md"
  fi
}

install_claude() {
  local target_dir="$INSTALL_BASE/.claude/skills/ai-product-delivery-workflow"
  mkdir -p "$target_dir"
  cp "$SKILL_SOURCE" "$target_dir/SKILL.md"
  echo "Installed Claude Code skill: $target_dir/SKILL.md"

  if [[ "$TARGET_TYPE" == "project" ]]; then
    safe_copy_if_missing "$SOURCE_DIR/CLAUDE.md" "$INSTALL_BASE/CLAUDE.md"
  fi
}

install_copilot() {
  local target_dir

  if [[ "$TARGET_TYPE" == "user" ]]; then
    target_dir="$INSTALL_BASE/.copilot/skills/ai-product-delivery-workflow"
  else
    target_dir="$INSTALL_BASE/.github/skills/ai-product-delivery-workflow"
  fi

  mkdir -p "$target_dir"
  cp "$SKILL_SOURCE" "$target_dir/SKILL.md"
  echo "Installed Copilot/VS Code skill: $target_dir/SKILL.md"

  if [[ "$TARGET_TYPE" == "project" ]]; then
    safe_copy_if_missing "$SOURCE_DIR/.github/copilot-instructions.md" "$INSTALL_BASE/.github/copilot-instructions.md"
  fi
}

case "$MODE" in
  all)
    install_codex
    install_claude
    install_copilot
    ;;
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  copilot)
    install_copilot
    ;;
esac

echo "Installation complete. Target: $INSTALL_BASE"
