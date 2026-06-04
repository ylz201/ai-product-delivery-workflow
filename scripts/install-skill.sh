#!/bin/bash

# Install ai-product-delivery-workflow skill to a target project
# Usage: ./install-skill.sh [project|user] [all|codex|claude|copilot] /path/to/project

TARGET_TYPE=$1
MODE=$2
TARGET_PATH=$3

if [ -z "$TARGET_TYPE" ] || [ -z "$MODE" ]; then
  echo "Usage: $0 [project|user] [all|codex|claude|copilot] /path/to/project"
  exit 1
fi

if [ "$TARGET_TYPE" = "user" ]; then
  INSTALL_BASE="$HOME"
else
  INSTALL_BASE="$TARGET_PATH"
fi

mkdir -p "$INSTALL_BASE/.agents/skills/ai-product-delivery-workflow"
mkdir -p "$INSTALL_BASE/.claude/skills/ai-product-delivery-workflow"
mkdir -p "$INSTALL_BASE/.github/skills/ai-product-delivery-workflow"

cp SKILL.md "$INSTALL_BASE/.agents/skills/ai-product-delivery-workflow/SKILL.md"
cp SKILL.md "$INSTALL_BASE/.claude/skills/ai-product-delivery-workflow/SKILL.md"
cp SKILL.md "$INSTALL_BASE/.github/skills/ai-product-delivery-workflow/SKILL.md"

echo "Installed ai-product-delivery-workflow skill to $INSTALL_BASE"