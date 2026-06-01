#!/bin/bash
set -euo pipefail

# First Principles Plan — Install Script
# Usage: curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-plan/main/install.sh | bash

REPO_URL="https://github.com/reshiner/first-principles-plan.git"
INSTALL_DIR="${HOME}/.agents/skills/first-principles-plan"

echo "📦 Installing First Principles Plan..."

if [ -d "$INSTALL_DIR/.git" ]; then
  echo "  → Updating existing installation..."
  git -C "$INSTALL_DIR" pull --ff-only
else
  echo "  → Cloning repository..."
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

echo ""
echo "✅ Installed to ${INSTALL_DIR}"
echo ""
echo "   • SKILL.md  —  Auto-loaded by agent tools that scan ~/.agents/skills/"
echo "   • commands/fpp.md  —  /fpp slash command (if your agent supports it)"
echo ""
echo "   Automatic triggers include:"
echo "     - \"第一性原理\" / \"从根本分析\""
echo "     - \"challenge assumptions\" / \"question this design\""
echo "     - Non-trivial code modification requests"
echo ""