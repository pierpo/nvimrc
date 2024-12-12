-- Initialization
-- vim.cmd('scriptencoding utf-8')

-- Autocommand group setup
vim.api.nvim_create_augroup("vimrc", {})
vim.api.nvim_clear_autocmds { group = "vimrc" }

-- Plugins
require "config.plugins"

-- Generic configuration
vim.o.scrolljump = 5
vim.cmd "syntax sync minlines=256"
vim.o.foldmethod = "marker"

vim.opt.wildignore:append "*DS_Store*"
vim.o.wildoptions = "pum"

vim.o.mouse = "a"
vim.o.number = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.spell = false
vim.o.showmatch = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.inccommand = "nosplit"
vim.o.linebreak = true
vim.o.showbreak = "↳ "

if vim.fn.has "termguicolors" == 1 then
  vim.o.termguicolors = true
end

vim.opt.diffopt:append "vertical"
vim.o.hidden = true
vim.o.undofile = true
vim.g.mapleader = ","

-- HTML indent settings
vim.g.html_indent_script1 = "inc"
vim.g.html_indent_style1 = "inc"
vim.g.html_indent_inctags = "html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section"

-- Error formats
vim.o.errorformat = vim.o.errorformat .. "%f:\\ line\\ %l\\,\\ col\\ %c\\,\\ %trror\\ -\\ %m"
vim.o.errorformat = vim.o.errorformat .. "%f:\\ line\\ %l\\,\\ col\\ %c\\,\\ %tarning\\ -\\ %m"

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = "yes"

vim.api.nvim_create_autocmd("CompleteDone", {
  group = "vimrc",
  pattern = "*",
  command = "silent! pclose!",
})

-- Python provider
if vim.fn.has "macunix" == 1 then
  vim.g.python_host_prog = "/usr/local/bin/python"
  vim.g.python3_host_prog = "/usr/local/bin/python3"
else
  vim.g.python_host_prog = "/usr/bin/python"
  vim.g.python3_host_prog = "/usr/bin/python3"
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "vimrc",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 700 }
  end,
})

-- Mappings
vim.keymap.set("n", "Y", "yg_", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true })

vim.keymap.set("n", "<Leader>W", ":noautocmd w<CR>", { noremap = true, silent = true })

-- Plugin configurations
vim.g.loaded_netrwPlugin = 1
require "config.lsp"
require "config.treesitter"
require "config.gitsigns"
require "config.formatter"
require "config.colorscheme-and-lualine"
require "config.telescope"
require "config.dap"
require "config.autopairs"
require "config.snippets"
require "config.notify"
require "config.cmp"

require("git-conflict").setup()
require("colorizer").setup()
require("terminal").setup()
require("noice").setup {
  presets = {
    lsp_doc_border = true,
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
}

-- Dirvish configuration
vim.api.nvim_create_autocmd("FileType", {
  group = "vimrc",
  pattern = "dirvish",
  callback = function()
    vim.keymap.set("n", "t", 'ddO<Esc>:let @"=substitute(@", "\\n", "", "g")<CR>', { noremap = true, buffer = true })
  end,
})

if vim.fn.executable "rg" == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --hidden"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

vim.keymap.set("n", "<Leader>rg", ':grep! "<C-R><C-W>"<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>grep", ':grep! -F ""<Left>', { noremap = true, silent = true })

-- Clear search highlight with alt-h on macos
vim.keymap.set("n", "¬", ":nohlsearch<CR>", { noremap = true, silent = true })
-- Clear search highlight with alt-- on macos
vim.keymap.set("n", "–", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "-", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })

require("neo-tree").setup {
  event_handlers = {

    {
      event = "file_open_requested",
      handler = function()
        -- auto close
        -- vim.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute { action = "close" }
      end,
    },
  },
}

-- Map ctrl + - to dismiss
vim.keymap.set("n", "", ":lua require('notify').dismiss()<CR>", { noremap = true, silent = true })
