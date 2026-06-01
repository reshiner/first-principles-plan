#!/bin/bash
set -euo pipefail

# First Principles Plan — Install Script
# Usage: curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-plan/main/install.sh | bash

REPO_URL="https://github.com/reshiner/first-principles-plan.git"
INSTALL_DIR="${HOME}/.agents/skills/first-principles-plan"
COMMAND_DIR="${HOME}/.claude/commands"
CODEX_SKILL_DIR="${HOME}/.codex/skills/first-principles-plan"

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

# Install SKILL.md for Claude Code
echo "  → Installing skill for Claude Code..."

# Install slash command for Claude Code
echo "  → Installing /fpp slash command..."
mkdir -p "$COMMAND_DIR"
ln -sf "${INSTALL_DIR}/commands/fpp.md" "${COMMAND_DIR}/fpp.md"

# Install SKILL.md for Codex CLI (if Codex is installed)
if [ -d "${HOME}/.codex/skills" ]; then
  echo "  → Installing skill for Codex CLI..."
  mkdir -p "$CODEX_SKILL_DIR"
  cp "${INSTALL_DIR}/SKILL.md" "${CODEX_SKILL_DIR}/SKILL.md"
fi

echo ""
echo "✅ First Principles Plan installed successfully!"
echo ""
echo "   Claude Code:"
echo "     /fpp  —  Trigger first principles analysis (manual)"
echo "     Skill auto-loads from ~/.agents/skills/"
echo ""
if [ -d "${HOME}/.codex/skills" ]; then
  echo "   Codex CLI:"
echo "     Skill installed at ~/.codex/skills/first-principles-plan/"
  echo ""
fi
echo "   Automatic triggers include:"
echo "     - \"第一性原理\" / \"从根本分析\""
echo "     - \"challenge assumptions\" / \"question this design\""
echo "     - Non-trivial code modification requests"
echo ""