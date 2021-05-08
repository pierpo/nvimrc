prettierformatter = {
    -- prettier
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = prettierformatter,
    javascriptreact = prettierformatter,
    typescript = prettierformatter,
    typescriptreact = prettierformatter,
  }
})
