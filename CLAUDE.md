# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration written in Lua, using **lazy.nvim** as the plugin manager.

## No Build/Test Commands

This is a configuration repository — there are no build, lint, or test commands. Changes take effect when Neovim is restarted or files are re-sourced.

To apply plugin changes: open Neovim and run `:Lazy sync`. To format Lua files: `stylua .` (config in `.stylua.toml`).

## Architecture

**Entry point**: `init.lua` — sets leader key (`,`), vim options, global keymaps, and calls all config modules via `pcall(require, "config.*")`.

**Plugin specifications**: `lua/plugins/init.lua` — single file listing all plugins for lazy.nvim.

**Plugin configurations**: `lua/config/` — one file per plugin or concern:
- `lazy.lua` — plugin manager bootstrap
- `lsp.lua` — LSP servers, global `on_attach`, keymaps, none-ls/ESLint
- `cmp.lua` — completion sources and formatting
- `telescope.lua` — fuzzy finder keymaps
- `treesitter.lua` — syntax and incremental selection
- `gitsigns.lua` — git hunk navigation and signs
- `dap.lua` — Node.js debugger setup
- `colorscheme-and-lualine.lua` — TokyoNight theme and status line
- `oil.lua`, `autopairs.lua`, `snippets.lua`, `notify.lua`, `formatter.lua`

**Shared utilities**:
- `lua/const/LSP_KIND.lua` — Nerd Font icon mappings for LSP symbol kinds
- `lua/sugar/highlight.lua` — highlight group helpers (`set`, `link`, `fg`, `bg`, `blend`, `colorscheme`)

**Filetype overrides**: `ftplugin/<filetype>.vim` for per-language settings.

**Snippets**: `snippets/` — LuaSnip in vim-snipmate format. Edit with `:LuaSnippetEdit`.

**Custom commands**: `plugin/pierpo.vim` — defines `:PPConflicts`, `:PPOpenTest`, `:PPWatchTests`, and `<Leader>test`.

## Key Design Patterns

- All plugin configs are loaded with `pcall` so failures don't break startup.
- LSP `on_attach` in `lsp.lua` sets buffer-local keymaps and auto-format on save for servers that support it.
- TypeScript uses `typescript-tools.nvim` (not standard lspconfig); ESLint runs via none-ls/eslint_d.
- The `Highlight` module in `lua/sugar/highlight.lua` is used for dynamic colorscheme-aware styling (e.g., in `cmp.lua`).
- Indentation default: 2 spaces (expandtab). GDScript overrides to 4 spaces/noexpandtab in `ftplugin/gdscript.vim`.

## Configured LSP Servers

`lua_ls`, `typescript-tools` (TS/JS), `gdscript` (Godot), `flow`, `clangd` (C/C++), `rust_analyzer`, `kotlin_language_server`, `prosemd-lsp` (Markdown).
