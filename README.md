# First Principles Plan

A [Claude Code](https://claude.ai/code) skill that breaks the "minimal change" bias in AI-assisted development. When AI agents modify existing code, they default to producing the smallest possible diff — which leads to accreted complexity, patched-over abstractions, and design debt. This skill forces a structured process:

1. **Decompose** — understand the user's true intent, critically evaluate existing code for design debt
2. **Design** — imagine the ideal solution from first principles, ignoring existing code
3. **Reconcile** — compare the minimal-change path vs. the ideal design, and make a reasoned recommendation

The skill does **not** always recommend refactoring. It makes the tradeoff **explicit** so you know what you're accepting.

## Features

- **`/fpp` slash command** — manually trigger first-principles analysis
- **Automatic trigger** — activates on phrases like "第一性原理", "challenge assumptions", "从根本分析", and non-trivial code modification requests
- **Structured output** — produces a `First Principles Analysis` document with intent, critique, clean-sheet design, path comparison, and recommendation
- **Decision framework** — 4 heuristics (touch frequency, provably wrong, Strangler Fig, compounding debt) to guide the recommendation

## Installation

### Install

```bash
curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-plan/main/install.sh | bash
```

Or clone manually:

```bash
git clone https://github.com/reshiner/first-principles-plan.git ~/.agents/skills/first-principles-plan
```

That's it. The skill is placed at `~/.agents/skills/first-principles-plan/`. Any agent tool that scans this directory will discover both the **SKILL.md** (for automatic triggering) and the **commands/fpp.md** (for the `/fpp` slash command, if supported).

## Usage

```
# Manual trigger (stickler analysis):
/fpp We need to add webhook support to the notification system

# Or trigger via natural language:
用第一性原理分析一下这个现有的设计
Think from first principles about adding this feature
challenge assumptions in this codebase
```

The skill produces:

```markdown
# First Principles Analysis: <Feature Name>

## 1. Intent
## 2. Current Design Critique
## 2b. Assumptions Challenged
## 3. Clean-Sheet Design
## 4. Gap Analysis
## 5. Path Comparison (A: Minimal Modification vs B: Refactor)
## 6. Recommendation
```

## Structure

```
~/.agents/skills/first-principles-plan/     # Skill directory
├── .claude-plugin/
│   └── plugin.json                          # Plugin manifest
├── SKILL.md                                 # Main skill definition
├── commands/
│   └── fpp.md                               # /fpp slash command
├── README.md                                # This file
├── LICENSE                                  # MIT License
└── install.sh                               # Install script
```

## Design Philosophy

This skill addresses a specific problem in AI-assisted development: **LLMs naturally default to minimal-change paths**. Training data (most commits are small), system prompts ("surgical changes"), and risk-aversion all bias toward patching rather than fixing. The result is code quality decay through accretion.

The skill doesn't override the "surgical changes" principle — it adds a decision gate: *before* you decide to make a minimal change, you must explicitly consider whether the design itself is correct. If it is, the minimal change is the right answer. If it isn't, you should know that and make a conscious tradeoff.

## License

MIT