#!/bin/bash

# Verify installation of ai-product-delivery-workflow skill
TARGET_PATH=$1

if [ -z "$TARGET_PATH" ]; then
  echo "Usage: $0 /path/to/project"
  exit 1
fi

echo "Checking .agents/skills/ai-product-delivery-workflow..."
ls -la "$TARGET_PATH/.agents/skills/ai-product-delivery-workflow"

echo "Checking .claude/skills/ai-product-delivery-workflow..."
ls -la "$TARGET_PATH/.claude/skills/ai-product-delivery-workflow"

echo "Checking .github/skills/ai-product-delivery-workflow..."
ls -la "$TARGET_PATH/.github/skills/ai-product-delivery-workflow"

echo "Verification complete."