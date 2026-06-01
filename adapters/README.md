# Platform Adapters

Each subdirectory provides the platform-specific entry point for the core `SKILL.md` methodology.

| Directory | Platform | Format | Install flag |
|-----------|----------|--------|-------------|
| `claude/` | Claude Code | `.claude-plugin/plugin.json` + `commands/fpp.md` | auto-discovered |
| `codex/` | Codex CLI | `.agent.md` | `--codex` |
| `opencode/` | OpenCode | `.rule.md` | `--opencode` |

All adapters delegate to `../SKILL.md` as the single source of truth for the methodology.