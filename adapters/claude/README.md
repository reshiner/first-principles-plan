# Claude Code Adapter

Entry point for Claude Code's skill discovery system.

- `.claude-plugin/plugin.json` — Plugin manifest (name, description, author)
- `commands/fpp.md` — `/fpp` slash command definition

Claude Code discovers this skill automatically via `~/.agents/skills/` scanning.  
Root-level symlinks (`commands` → `adapters/claude/commands`, `.claude-plugin` → `adapters/claude/.claude-plugin`) ensure backward compatibility for existing installations.