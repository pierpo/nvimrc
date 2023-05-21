local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- if vim.fn.has('macunix') == 1 then
  --   use { '/usr/local/opt/fzf', 'junegunn/fzf.vim' }
  -- else
  --   use { 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }}
  --   use 'junegunn/fzf.vim'
  -- end

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'godlygeek/tabular' -- align stuff plugin
  use 'bronson/vim-trailing-whitespace' -- trailing whitespace plugin

  use 'hoob3rt/lualine.nvim' -- status line

  use 'AndrewRadev/splitjoin.vim' -- Split lines (like js objects)

  -- tpope plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'

  use 'tpope/vim-rhubarb' -- :Gbrowse

  -- text objects
  use 'kana/vim-textobj-user'
  use 'Julian/vim-textobj-variable-segment'
  use 'kana/vim-textobj-line'

  use 'michaeljsmith/vim-indent-object' -- Select by indent

  use 'arp242/jumpy.vim' -- Remap [[ and ]] to make it work properly with most filetypes

  use 'AndrewRadev/switch.vim' -- Switch true to false

  -- Colorschemes
  use 'ChristianChiarulli/nvcode-color-schemes.vim' -- colorscheme for treesitter
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'

  use 'AndrewRadev/sideways.vim' -- Cycle arguments/properties

  use 'romainl/vim-qf' -- Filter the quickfix list

  -- Instead of gitgutter
  use 'lewis6991/gitsigns.nvim'

  use 'akinsho/git-conflict.nvim' -- Git conflicts

  use 'chr4/nginx.vim' -- nginx

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  use 'kevinhwang91/rnvimr' -- Ranger

  -- lsp and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'williamboman/mason.nvim' -- Symbols

  use 'onsails/lspkind-nvim' -- Icons for nvim cmp

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'justinmk/vim-dirvish' -- file explorer

  use 'mhartington/formatter.nvim' -- formatter

  use 'kyazdani42/nvim-web-devicons' -- icons

  use 'jose-elias-alvarez/typescript.nvim' -- typescript

  use 'norcalli/nvim-colorizer.lua' -- colorizer

  -- debugger
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'rcarriga/nvim-dap-ui'

  -- autopairs and autotags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'norcalli/nvim-terminal.lua' -- Useful for ANSI colors on log dumps

  use 'stevearc/dressing.nvim' -- Override vim ui

  use 'rcarriga/nvim-notify' -- notifications

  use 'numToStr/Comment.nvim' -- comments

  if packer_bootstrap then
    require('packer').sync()
  end
end)
