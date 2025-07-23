-- lua/plugins/init.lua
return {
  -- lazy itself
  { "folke/lazy.nvim" },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- Snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Utilities
  "godlygeek/tabular",
  "bronson/vim-trailing-whitespace",
  "AndrewRadev/splitjoin.vim",
  "AndrewRadev/switch.vim",
  "AndrewRadev/sideways.vim",
  "romainl/vim-qf",

  -- Lualine
  "hoob3rt/lualine.nvim",

  -- tpope plugins
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
  "tpope/vim-eunuch",
  "tpope/vim-abolish",
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "tpope/vim-rhubarb",

  -- text objects
  "kana/vim-textobj-user",
  {
    "Julian/vim-textobj-variable-segment",
    dependencies = { "kana/vim-textobj-user" },
  },
  {
    "kana/vim-textobj-line",
    dependencies = { "kana/vim-textobj-user" },
  },
  "michaeljsmith/vim-indent-object",

  -- motion
  "arp242/jumpy.vim",

  -- colorschemes
  "ChristianChiarulli/nvcode-color-schemes.vim",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "projekt0n/github-nvim-theme",

  -- Git
  "lewis6991/gitsigns.nvim",
  "akinsho/git-conflict.nvim",

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/playground",

  -- ranger
  -- "kevinhwang91/rnvimr",

  -- LSP
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  "onsails/lspkind-nvim",
  "williamboman/mason-lspconfig.nvim",

  { "pmizio/typescript-tools.nvim", dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } },
  "dmmulroy/ts-error-translator.nvim",

  -- Telescope
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- formatter
  "mhartington/formatter.nvim",

  -- UI/UX
  "nvim-tree/nvim-web-devicons",
  "norcalli/nvim-colorizer.lua",
  "stevearc/dressing.nvim",
  "rcarriga/nvim-notify",

  -- Comments
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- DAP
  "mfussenegger/nvim-dap",
  "nvim-telescope/telescope-dap.nvim",
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",

  -- Autopairs
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  -- Terminal ANSI support
  "norcalli/nvim-terminal.lua",

  -- Treesitter-based smart join/split
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },

  -- Better notifications / command-line UI
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- optional: neo-tree (commented out in your original)
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
}
