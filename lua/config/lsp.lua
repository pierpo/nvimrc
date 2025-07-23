require("mason").setup()

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local lsp_configs = require "lspconfig.configs"

-- Global on_attach function
local on_attach = function(client, bufnr)
  local function buf_map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
    opts.buffer = bufnr
    -- only pass string or function rhs
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
    vim.diagnostic.goto_next { float = { border = "double" } }
  end)
  buf_map("n", "[g", function()
    vim.diagnostic.goto_prev { float = { border = "double" } }
  end)
  buf_map("n", "gA", vim.lsp.buf.code_action)
  buf_map("v", "ga", function()
    vim.lsp.buf.code_action {
      range = {
        ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
        ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
      },
      context = { only = { "quickfix", "refactor" }, diagnostics = {} },
    }
  end)
  buf_map("n", "<space>a", function()
    require("telescope.builtin").diagnostics { bufnr = 0 }
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
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" })

-- TypeScript (uses external plugin)
require("typescript-tools").setup {
  on_attach = on_attach,
}

-- Lua LSP (sumneko/lua-language-server or lua_ls)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
}

-- Other standard LSPs
lspconfig.gdscript.setup { on_attach = on_attach }
lspconfig.flow.setup { on_attach = on_attach }
lspconfig.clangd.setup { on_attach = on_attach }
lspconfig.rust_analyzer.setup { on_attach = on_attach }
lspconfig.kotlin_language_server.setup {
  on_attach = on_attach,
  root_dir = util.root_pattern "settings.gradle",
}

-- prosemd-lsp (Markdown prose linter)
if not lsp_configs.prosemd then
  lsp_configs.prosemd = {
    default_config = {
      cmd = { "prosemd-lsp", "--stdio" },
      filetypes = { "markdown" },
      root_dir = function(fname)
        return util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
      settings = {},
    },
  }
end

lspconfig.prosemd.setup {
  on_attach = on_attach,
}

-- Optional: translate TS errors to readable form
pcall(require("ts-error-translator").setup)

local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    require "none-ls.diagnostics.eslint_d",
    require "none-ls.code_actions.eslint_d",
    require "none-ls.formatting.eslint_d",
  },
}
