#!/bin/bash
set -euo pipefail

# First Principles Plan — Install Script
# Usage: curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-plan/main/install.sh | bash

REPO_URL="https://github.com/reshiner/first-principles-plan.git"
INSTALL_DIR="${HOME}/.agents/skills/first-principles-plan"
COMMAND_DIR="${HOME}/.claude/commands"

echo "📦 Installing First Principles Plan..."

# Clone or update the repo
if [ -d "$INSTALL_DIR/.git" ]; then
  echo "  → Updating existing installation..."
  git -C "$INSTALL_DIR" pull --ff-only
else
  echo "  → Cloning repository..."
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Install the slash command
echo "  → Installing /fpp slash command..."
mkdir -p "$COMMAND_DIR"
ln -sf "${INSTALL_DIR}/commands/fpp.md" "${COMMAND_DIR}/fpp.md"

echo ""
echo "✅ First Principles Plan installed successfully!"
echo ""
echo "   Commands available:"
echo "     /fpp  —  Trigger first principles analysis"
echo ""
echo "   The skill also activates automatically on phrases like:"
echo "     - \"第一性原理\" / \"从根本分析\""
echo "     - \"challenge assumptions\" / \"question this design\""
echo "     - Non-trivial code modification requests"
echo ""