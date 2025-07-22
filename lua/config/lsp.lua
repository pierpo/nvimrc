require("mason").setup()
require("mason-lspconfig").setup {
  automatic_enable = true,
}

local util = require "lspconfig/util"
local lsp_configs = require "lspconfig.configs"

-- Global on_attach function
local on_attach = function(client, bufnr)
  local buf_map = vim.api.nvim_buf_set_keymap
  buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
  buf_map(bufnr, "n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
  buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
  buf_map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
  buf_map(bufnr, "n", "<c-e>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
  buf_map(bufnr, "n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {})
  buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {})
  buf_map(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
  buf_map(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "double" }})<CR>', {})
  buf_map(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "double" }})<CR>', {})
  buf_map(bufnr, "n", "gA", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true })
  buf_map(bufnr, "v", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", { noremap = true })
  buf_map(bufnr, "n", "<space>a", "<cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true })
  buf_map(bufnr, "n", "<space>s", '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>',
    { noremap = true })

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_exec([[
      augroup LspAutocommands
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil)
      augroup END
    ]], true)
  end
end

-- Borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" })

-- TypeScript (external plugin handles tsserver)
require("typescript-tools").setup {
  on_attach = on_attach,
}

-- ESLint
require('lspconfig').eslint.setup {
  root_dir = util.root_pattern(
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec([[
      augroup EslintAutofix
        autocmd! * <buffer>
        autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.cjs EslintFixAll
      augroup END
    ]], true)
    on_attach(client, bufnr)
  end,
}

-- vim.lsp.config("eslint", {
--   root_dir = util.root_pattern(
--     ".eslintrc",
--     ".eslintrc.js",
--     ".eslintrc.cjs",
--     ".eslintrc.yaml",
--     ".eslintrc.yml",
--     ".eslintrc.json"
--   ),
--   on_attach = function(client, bufnr)
--     vim.api.nvim_exec([[
--       augroup EslintAutofix
--         autocmd! * <buffer>
--         autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.cjs EslintFixAll
--       augroup END
--     ]], true)
--     on_attach(client, bufnr)
--   end,
-- })

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

-- Other servers
vim.lsp.config("gdscript", { on_attach = on_attach })
vim.lsp.config("flow", { on_attach = on_attach })
vim.lsp.config("clangd", { on_attach = on_attach })
vim.lsp.config("rust_analyzer", { on_attach = on_attach })
vim.lsp.config("kotlin_language_server", {
  on_attach = on_attach,
  root_dir = util.root_pattern("settings.gradle"),
})

-- prosemd custom config
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
vim.lsp.config("prosemd", { on_attach = on_attach })

-- Extra
require("ts-error-translator").setup()
