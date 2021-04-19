prettierformatter = {
    -- prettier
    function()
      return {
        exe = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
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
