# Claude Code Adapter / Claude Code 适配器

Entry point for Claude Code's skill discovery system.
Claude Code 技能发现系统的入口。

## Files / 文件

- `.claude-plugin/plugin.json` — Plugin manifest (name, description, author) / 插件清单
- `commands/fpt.md` — `/fpt` slash command definition / 斜杠命令定义

## Discovery / 发现机制

Claude Code discovers and loads this skill through the v2 plugin system — registration in `installed_plugins.json` and `settings.json` enables the `/fpt` slash command and the `first-principles-thinking` skill from the plugin's `skills/` directory.
Claude Code 通过 v2 插件系统发现并加载此技能 — 在 `installed_plugins.json` 和 `settings.json` 中注册后，即可启用 `/fpt` 斜杠命令和插件 `skills/` 目录中的 first-principles-thinking 技能。

Root-level symlinks (`commands` → `adapters/claude/commands`, `.claude-plugin` → `adapters/claude/.claude-plugin`, `skills` → `adapters/claude/skills`) ensure compatibility for both marketplace install and script-based install.
根目录的符号链接（`commands`、`.claude-plugin`、`skills`）确保 marketplace 安装和脚本安装两种方式都能正常工作。