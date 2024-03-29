eslintfix = {
  -- prettier
  function()
    return {
      exe = "eslint_d",
      args = { "--stdin", "--fix-to-stdout", "--stdin-filename", vim.api.nvim_buf_get_name(0) },
      stdin = true,
    }
  end,
}

luafmt = {
  -- luafmt
  function()
    return {
      exe = "luafmt",
      args = { "--indent-count", 4, "--stdin" },
      stdin = true,
    }
  end,
}

stylua = {
  -- luafmt
  function()
    return {
      exe = "stylua",
      args = {
        "-",
        "-s",
        "--stdin-filepath",
        vim.api.nvim_buf_get_name(0),
      },
      stdin = true,
    }
  end,
}

prettierjson = {
  -- prettier
  function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        vim.api.nvim_buf_get_name(0),
        "--single-quote",
        "false",
        "--tab-width",
        "2",
        "--trailing-commas",
        "false",
      },
      stdin = true,
    }
  end,
}

require("formatter").setup {
  logging = false,
  filetype = {
    javascript = eslintfix,
    javascriptreact = eslintfix,
    typescript = eslintfix,
    typescriptreact = eslintfix,
    json = prettierjson,
    lua = stylua,
  },
}

-- Format on save for .lua files
vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
  augroup END
]],
  true
)
