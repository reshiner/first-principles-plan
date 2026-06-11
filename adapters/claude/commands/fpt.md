---
description: "First Principles Thinking — critically evaluate existing design, design the ideal solution, then reconcile. Supports two modes: Standalone (analyze project code) and Review Gate (review spec/plan drafts). / 第一性原理分析 — 批判性评估现有设计，设计理想方案，做出权衡推荐。支持两种模式：Standalone（分析项目代码）和 Review Gate（审查方案/计划草案）。"
argument-hint: "Describe the design to analyze or document to review / 描述你想要分析的设计或审查的文档"
allowed-tools: Read, Write, Edit, Bash, Glob
---

# First Principles Thinking

Load and follow the **first-principles-thinking** skill from this plugin: `skills/first-principles-thinking/SKILL.md`.

## Quick Start

$ARGUMENTS is the user's input. If they describe a feature or code to analyze, use **Standalone 模式** (analyze project code). If they pass a source document (spec/plan/brainstorming output) for review, use **Review Gate 模式** (review the document's assumptions and design). If unclear, ask the user which mode they intend.

Follow the four-phase process **in order**:
1. **Phase 1: Decompose** — surface intent, decompose existing code or source document, diagnose design debt / extract assumptions
2. **Phase 2: Design** — clean-sheet design from fundamentals (for the project code or the document's requirements), document the gap
3. **Phase 3: Reconcile** — compare Path A vs Path B, apply decision framework, produce recommendation
4. **Phase 4: Iterative Refinement** — collaborate with the user to revise the analysis until finalized

Output the structured document as specified in the skill. For Standalone mode: `First Principles Analysis` document saved to `docs/fpt/` on request. For Review Gate mode: structured `FPT Review Feedback`.