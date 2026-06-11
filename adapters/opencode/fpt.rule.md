---
# OpenCode rules format
# Fields: name (required), description (required)
name: first-principles-thinking
description: "Forces first-principles thinking — critically evaluate existing design, design the ideal solution, then reconcile. Supports Standalone mode (analyze project code) and Review Gate mode (review spec/plan drafts). / 第一性原理思考 — 批判性评估现有设计，设计理想方案，做出权衡推荐。支持 Standalone（分析项目代码）和 Review Gate（审查方案草案）两种模式。"
---

# First Principles Thinking

> **OpenCode adapter** — This file provides the entry point for OpenCode (`~/.opencode/skills/first-principles-thinking/`).
> It delegates to the canonical methodology at `../../SKILL.md` (the repo root).
> Format: `.rule.md` with YAML frontmatter (name, description).

Load and follow the full instructions from `../../SKILL.md`.

This adapter is installed via: `bash install.sh --opencode`

This skill implements a structured four-phase analysis with **two invocation modes**:

## Invocation Modes

### Mode A: Standalone（独立分析）
- **Scenario:** User directly asks to analyze project code (e.g., "从根本分析XX", "这个设计合理吗")
- **Input:** Project code
- **Output:** Complete FPT analysis document, savable to `docs/fpt/`

### Mode B: Review Gate（审核关卡）
- **Scenario:** Triggered after a brainstorming/writing-plans/subagent-driven-development draft is produced, to review the output before proceeding
- **Input:** Source document (spec/plan/brainstorming output), not project code
- **Output:** Structured review feedback with assumption challenges and revision suggestions

## Phase 1: Decompose
1. **Surface Intent** — What is the user's fundamental goal? Strip away implementation specifics.
2. **Decompose** (mode-dependent):
   - **Standalone:** Map existing code entities, data flow, control flow, boundaries
   - **Review Gate:** Extract claims, silent assumptions, code-bound decisions, and gaps from the source document
3. **Diagnose** (mode-dependent):
   - **Standalone:** Diagnose design debt — coupling, cohesion, abstraction boundaries, hidden assumptions, extension cost, duplication
   - **Review Gate:** Extract and tag assumptions (challenge-worthy, accepted, risky)

## Phase 2: Design
1. **Clean-Sheet Design** (mode-dependent):
   - **Standalone:** Ignore existing code. Design the ideal solution from fundamentals. Name interfaces, entities, relationships.
   - **Review Gate:** Design the ideal solution for the document's requirements, ignoring code-bound constraints.
2. **Document the Gap** — Table comparing Current vs Ideal vs Delta (or Source Document vs Ideal Plan).

## Phase 3: Reconcile
1. **Path A (Minimal Modification)** — Smallest change that works. Document debt accumulated.
2. **Path B (First-Principles Refactor)** — Move toward ideal design. Document risk and migration cost.
3. **Compare and Recommend** — Use 4 heuristics: touch frequency, provably wrong vs suboptimal, Strangler Fig decomposability, compounding debt. Include Issue Resolution Traceability table.
4. **Output** (mode-dependent):
   - **Standalone:** Structured `First Principles Analysis` document with 6+ sections
   - **Review Gate:** Structured `FPT Review Feedback` with assumption challenges, design blind spots, section-by-section revision suggestions

## Phase 4: Iterative Refinement
- Present analysis v1.0 to the user and invite feedback
- Apply revisions with version increments (v1.0 → v1.1 → ...)
- Always output the full revised document with a "Changes in this version" summary
- Exit on confirmation, save, or topic change

## Trigger Conditions
**Use when:**
- User explicitly asks for structural critique / assumption challenge
- User says "第一性原理" / "从根本分析" / "这个设计合理吗" / "challenge assumptions" / "question this design"
- Source document (spec/plan/brainstorming output) needs first-principles review
- Change touches core architecture/interfaces and user wants design review
- You feel the "this doesn't fit" tension about an existing design

**Don't use when:**
- Trivial one-line changes
- Pure bug fixes with obvious root cause
- Greenfield / new file creation (no existing design to challenge)
- User explicitly asks for "the quickest fix"
- Standard superpowers workflow without explicit design-challenge request

## Core Principle
Do NOT always recommend refactoring. Make the tradeoff explicit between patching and redesigning. The goal is conscious decision-making, not maximum change.