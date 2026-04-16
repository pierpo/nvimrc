require("mason").setup()

-- Global on_attach function
local on_attach = function(client, bufnr)
  local function buf_map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
    opts.buffer = bufnr

    if type(rhs) == "string" or type(rhs) == "function" then
      vim.keymap.set(mode, lhs, rhs, opts)
    else
      vim.notify(
        string.format("Invalid RHS for keymap %s: expected string or function, got %s", lhs, type(rhs)),
        vim.log.levels.ERROR
      )
    end
  end

  buf_map("n", "gd", vim.lsp.buf.declaration)
  buf_map("n", "<c-]>", vim.lsp.buf.definition)
  buf_map("n", "K", vim.lsp.buf.hover)
  buf_map("n", "gD", vim.lsp.buf.implementation)
  buf_map("n", "<c-e>", vim.lsp.buf.signature_help)
  buf_map("n", "1gD", vim.lsp.buf.type_definition)
  buf_map("n", "gr", vim.lsp.buf.references)
  buf_map("n", "gR", vim.lsp.buf.rename)
  buf_map("n", "]g", function()
    vim.diagnostic.goto_next({ float = { border = "double" } })
  end)
  buf_map("n", "[g", function()
    vim.diagnostic.goto_prev({ float = { border = "double" } })
  end)
  buf_map("n", "gA", vim.lsp.buf.code_action)
  buf_map("v", "ga", function()
    vim.lsp.buf.code_action({
      range = {
        ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
        ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
      },
      context = { only = { "quickfix", "refactor" }, diagnostics = {} },
    })
  end)
  buf_map("n", "<space>a", function()
    require("telescope.builtin").diagnostics({ bufnr = 0 })
  end)
  buf_map("n", "<space>s", function()
    require("telescope.builtin").lsp_dynamic_workspace_symbols()
  end)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat" .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
end

-- Borders for floating windows
vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
  config = vim.tbl_deep_extend("force", config or {}, { border = "double" })
  return vim.lsp.handlers.hover(err, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
  config = vim.tbl_deep_extend("force", config or {}, { border = "double" })
  return vim.lsp.handlers.signature_help(err, result, ctx, config)
end

-- TypeScript
require("typescript-tools").setup({
  on_attach = on_attach,
})

-- Lua
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- GDScript
vim.lsp.config("gdscript", {
  on_attach = on_attach,
})
vim.lsp.enable("gdscript")

-- Flow
vim.lsp.config("flow", {
  on_attach = on_attach,
})
vim.lsp.enable("flow")

-- clangd
vim.lsp.config("clangd", {
  on_attach = on_attach,
})
vim.lsp.enable("clangd")

-- Rust
vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
})
vim.lsp.enable("rust_analyzer")

-- Kotlin
vim.lsp.config("kotlin_language_server", {
  on_attach = on_attach,
  root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git" },
})
vim.lsp.enable("kotlin_language_server")

-- prosemd-lsp (Markdown prose linter)
vim.lsp.config("prosemd", {
  cmd = { "prosemd-lsp", "--stdio" },
  filetypes = { "markdown" },
  root_markers = { ".git" },
  settings = {},
  on_attach = on_attach,
})
vim.lsp.enable("prosemd")

-- Optional: translate TS errors to readable form
pcall(function()
  require("ts-error-translator").setup()
end)

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    require("none-ls.formatting.eslint_d"),
  },
})
