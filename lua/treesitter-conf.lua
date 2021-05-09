require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    -- buggy for now, in typescript it makes the cursor go to col 0
    enable = false
  }
}
