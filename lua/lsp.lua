-- Inspired from
-- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c

local nvim_lsp = require "lspconfig"
local lsp_configs = require "lspconfig.configs"
local util = require "lspconfig/util"

-- {{{ Global configuration

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
  buf_map(bufnr, "n", "gA", '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap = true })
  buf_map(bufnr, "v", "ga", '<cmd>lua vim.lsp.buf.range_code_action()<cr>', { noremap = true })
  -- buf_map(bufnr, "n", "gA", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', { noremap = true })
  -- buf_map(bufnr, "v", "ga", '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>V', { noremap = true })
  buf_map(bufnr, "n", "<space>a", "<cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true })
  buf_map(
    bufnr,
    "n",
    "<space>s",
    '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>',
    { noremap = true }
  )

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec(
      [[
        augroup LspAutocommands
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil)
        augroup END
        ]],
      true
    )
  end
end

local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = 'luasnip' },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
}

cmp.setup.cmdline {
  mapping = cmp.mapping.preset.cmdline({
    -- Your configuration here.
  })
}

local lspkind = require "lspkind"
cmp.setup {
  formatting = {
    format = lspkind.cmp_format { with_text = true, maxwidth = 50 },
  },
}

-- Add borders to hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "double",
})

-- Add borders to signature help
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "double",
})
-- }}}

-- {{{ typescript
nvim_lsp.tsserver.setup {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)

    local ts_utils = require "nvim-lsp-ts-utils"
    ts_utils.setup {
      eslint_bin = "eslint_d",
    }

    ts_utils.setup_client(client)
  end,
}

nvim_lsp.eslint.setup{}

-- TODO use nvim 0.7 autocmd api
vim.cmd [[
  augroup ESlintAutosave
    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
  augroup end
]]

-- }}}

-- {{{ gdscript
nvim_lsp.gdscript.setup {
  on_attach = on_attach,
}
-- }}}

-- {{{ flow
nvim_lsp.flow.setup {
  on_attach = on_attach,
}
-- }}}

-- {{{ clangd
nvim_lsp.clangd.setup {
  on_attach = on_attach,
}
-- }}}

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

nvim_lsp.prosemd.setup { on_attach = on_attach }

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
}

nvim_lsp.kotlin_language_server.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern "settings.gradle",
}
