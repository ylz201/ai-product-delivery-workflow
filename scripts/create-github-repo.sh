#!/bin/bash

# Prepare this folder as a Git repository and print the commands needed to publish it.
# Usage: ./create-github-repo.sh owner/repo

REPO_FULL_NAME=$1

if [ -z "$REPO_FULL_NAME" ]; then
  echo "Usage: $0 owner/repo"
  exit 1
fi

if [ ! -d .git ]; then
  git init
fi

git add .
git commit -m "Initial ai product delivery workflow skill" || true
git branch -M main

echo "Now create an empty repository on GitHub named: $REPO_FULL_NAME"
echo "Then run:"
echo "git remote add origin git@github.com:$REPO_FULL_NAME.git"
echo "git push -u origin main"
