-- Inspired from
-- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c

local nvim_lsp = require("lspconfig")

local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async
_G.lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    buf_map(bufnr, "n", "gd",    "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
    buf_map(bufnr, "n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
    buf_map(bufnr, "n", "K",     "<cmd>lua vim.lsp.buf.hover()<CR>", {})
    buf_map(bufnr, "n", "gD",    "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
    buf_map(bufnr, "n", "<c-e>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
    buf_map(bufnr, "n", "1gD",   "<cmd>lua vim.lsp.buf.type_definition()<CR>", {})
    buf_map(bufnr, "n", "gr",    "<cmd>lua vim.lsp.buf.references()<CR>", {})
    buf_map(bufnr, "n", "gR",    "<cmd>lua vim.lsp.buf.rename()<CR>", {})
    buf_map(bufnr, "n", "]g",    "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = \"double\" }})<CR>", {})
    buf_map(bufnr, "n", "[g",    "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = \"double\" }})<CR>", {})

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
        augroup LspAutocommands
            autocmd! * <buffer>
            autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
        augroup END
        ]], true)
    end
end

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

local formatters = {
    prettier = {command = "./node_modules/.bin/prettier",
    rootPatterns = {".prettierrc", "package.json"},
    args = {"--stdin-filepath", "%filepath"}}
}

local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}

nvim_lsp.gdscript.setup{
  on_attach = on_attach
}

require"compe".setup {
    preselect = "always",
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm("<CR>")]], {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close("<C-e>")]], {expr = true, silent = true})

-- Add borders to hover
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "double"
  }
)

-- Add borders to signature help
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "double"
  }
)
