# First Principles Thinking

**English** | [中文](README.zh-CN.md)

A multi-platform AI coding skill that breaks the "minimal change" bias in LLM-assisted development.  
**Works with:** Claude Code · Codex CLI · OpenCode

When AI agents modify existing code, they default to producing the smallest possible diff — which leads to accreted complexity, patched-over abstractions, and design debt. This skill forces a structured process:

1. **Decompose** — understand the user's true intent, critically evaluate existing code or source documents for design debt and hidden assumptions
2. **Design** — imagine the ideal solution from first principles, ignoring existing code or code-bound constraints
3. **Reconcile** — compare the minimal-change path vs. the ideal design, and make a reasoned recommendation
4. **Refine** — collaboratively revise the analysis through iterative feedback until finalized

The skill operates in **two modes**: **Standalone** (analyze project code) and **Review Gate** (review spec/plan/brainstorming drafts for assumption challenges). The skill does **not** always recommend refactoring. It makes the tradeoff **explicit** so you know what you're accepting.

## Features

- **Two invocation modes** — **Standalone** (analyze project code) and **Review Gate** (review spec/plan/brainstorming drafts for assumption challenges)
- **`/fpt` slash command** (Claude Code) or equivalent trigger on other platforms
- **Automatic trigger** — activates when the user asks for structural critique, says "第一性原理"/"challenge assumptions"/"从根本分析"/"这个设计合理吗", or passes a source document for review
- **Structured output** — produces a `First Principles Analysis` document (Standalone) or `FPT Review Feedback` (Review Gate) with intent, critique, clean-sheet design, path comparison, and recommendation
- **Decision framework** — 4 heuristics (touch frequency, provably wrong, Strangler Fig, compounding debt) to guide the recommendation

## Installation

Choose your platform below.

### Claude Code (recommended)

Install via the marketplace (Claude Code v2.24+):

```
/plugin marketplace add https://github.com/reshiner/first-principles-thinking
/plugin install first-principles-thinking@reshiner
```

This registers the `reshiner` marketplace and installs the plugin — Claude Code discovers the `/fpt` slash command and auto-triggering skill automatically.

### Codex CLI

```bash
curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-thinking/main/install.sh | bash -s -- --codex
```

This creates a symlink at `~/.codex/skills/first-principles-thinking/` pointing to `adapters/codex/`.

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-thinking/main/install.sh | bash -s -- --opencode
```

This creates a symlink at `~/.opencode/skills/first-principles-thinking/` pointing to `adapters/opencode/`.

### All platforms

```bash
# Claude Code: use marketplace install (see above)
# Codex CLI + OpenCode:
curl -fsSL https://raw.githubusercontent.com/reshiner/first-principles-thinking/main/install.sh | bash -s -- --all
```

## Usage

### Standalone mode — Analyzing project code

```
# Claude Code:
/fpt Analyze the notification system design

# Natural language (any platform):
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

### Review Gate mode — Reviewing a spec/plan draft

Pass a source document (brainstorming output, spec, or plan) to review its assumptions and decisions:

```
审查这个方案的设计
Review this plan from first principles
```

The skill produces structured `FPT Review Feedback` with assumption challenges, design blind spots, and section-by-section revision suggestions.

### Saving the analysis to a file

After a Standalone analysis is presented, the agent will prompt you to save it as a local file. Simply say:

```
输出文档     # (Chinese — "output document")
save         # (English)
```

The document is saved to `docs/fpt/<date>-<topic>.md` in your project directory. Example:

```
docs/fpt/20260603-authentication-module-analysis.md
```

## Structure

```
first-principles-thinking/     # Repository root
├── SKILL.md                                 # Core methodology (platform-agnostic)
├── adapters/                                # Platform-specific entry points
│   ├── README.md                            # Adapter overview
│   ├── claude/
│   │   ├── .claude-plugin/plugin.json       # Claude Code plugin manifest
│   │   └── commands/fpt.md                  # /fpt slash command
│   ├── codex/                               # Codex CLI agent definition
│   │   └── fpt.agent.md
│   └── opencode/                            # OpenCode rules
│       └── fpt.rule.md
├── docs/fpt/                                 # FPT analysis documents & examples
│   ├── notification-system-fpt.md          # Example: Webhook support analysis
│   └── payment-checkout-fpt.md             # Example: Buy Now analysis
├── commands/ -> adapters/claude/commands    # `/fpt` slash command (root symlink for marketplace install)
├── .claude-plugin/ -> adapters/claude/.claude-plugin  # Plugin manifest (root symlink for marketplace install)
├── skills/ -> adapters/claude/skills       # Skill content (root symlink for marketplace install)
├── README.md                                # This file (English)
├── README.zh-CN.md                          # Introduction (中文)
├── LICENSE                                  # MIT License
└── install.sh                               # Install script
```

## Examples

Real-world FPT analysis documents demonstrating the skill in action:

| Example | Language | Scenario | Key Takeaway |
|---------|----------|----------|--------------|
| [Notification System — Webhook Support](docs/fpt/notification-system-fpt.md) | 中文 | Adding a new notification channel to an `if-elif` based sender | Shows how FPT catches design debt before adding the N+1th branch; recommends **Hybrid** (Strangler Fig for safe incremental refactor) |
| [Payment Checkout — Buy Now](docs/fpt/payment-checkout-fpt.md) | English | Adding one-click purchase to a multi-step checkout flow | Shows when FPT **recommends the minimal patch** — because the debt hasn't compounded enough yet. Includes a documented refactoring trigger for when it should be revisited |

Each example walks through all six sections of the FPT output format. They are self-contained demonstrations — the code snippets are illustrative, not from real repositories.

## Design Philosophy

This skill addresses a specific problem in AI-assisted development: **LLMs naturally default to minimal-change paths**. Training data (most commits are small), system prompts ("surgical changes"), and risk-aversion all bias toward patching rather than fixing — whether the target is code or a design document. The result is quality decay through accretion.

The skill doesn't override the "surgical changes" principle — it adds a decision gate: *before* you decide to make a minimal change, you must explicitly consider whether the design itself is correct. If it is, the minimal change is the right answer. If it isn't, you should know that and make a conscious tradeoff.

## License

MIT