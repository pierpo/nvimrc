-- Initialization
-- vim.cmd('scriptencoding utf-8')

-- Autocommand group setup
local vimrc_group = vim.api.nvim_create_augroup("vimrc", { clear = true })

vim.g.mapleader = ","

-- Plugins
require "config.lazy"

-- General configuration
vim.opt.scrolljump = 5
vim.cmd "syntax sync minlines=256"
vim.opt.foldmethod = "marker"

vim.opt.wildignore:append "*DS_Store*"
vim.opt.wildoptions = "pum"

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.spell = false
vim.opt.showmatch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.inccommand = "nosplit"
vim.opt.linebreak = true
vim.opt.showbreak = "↳ "

if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

vim.opt.diffopt:append "vertical"
vim.opt.undofile = true

-- HTML indent settings
vim.g.html_indent_script1 = "inc"
vim.g.html_indent_style1 = "inc"
vim.g.html_indent_inctags = "html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section"

-- Error format
vim.opt.errorformat:append {
  "%f:\\ line\\ %l\\,\\ col\\ %c\\,\\ %trror\\ -\\ %m",
  "%f:\\ line\\ %l\\,\\ col\\ %c\\,\\ %tarning\\ -\\ %m",
}

vim.opt.shortmess:append "c"
vim.opt.signcolumn = "yes"

-- Close preview window on completion
vim.api.nvim_create_autocmd("CompleteDone", {
  group = vimrc_group,
  pattern = "*",
  command = "silent! pclose!",
})

-- Python provider (portable)
vim.g.python3_host_prog = vim.fn.exepath "python3"
vim.g.python_host_prog = vim.fn.exepath "python"

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vimrc_group,
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

pcall(require, "config.lsp")
pcall(require, "config.treesitter")
pcall(require, "config.gitsigns")
pcall(require, "config.formatter")
pcall(require, "config.colorscheme-and-lualine")
pcall(require, "config.telescope")
pcall(require, "config.dap")
pcall(require, "config.autopairs")
pcall(require, "config.snippets")
pcall(require, "config.notify")
pcall(require, "config.cmp")
pcall(require, "config.oil")

pcall(require("git-conflict").setup)
pcall(require("colorizer").setup)
pcall(require("terminal").setup)

pcall(require("noice").setup, {
  presets = {
    lsp_doc_border = true,
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
})

-- ripgrep as grepprg
if vim.fn.executable "rg" == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"
  vim.opt.grepformat = { "%f:%l:%c:%m", "%f:%l:%m" }
end

vim.keymap.set("n", "<Leader>rg", ':grep! "<C-R><C-W>"<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>grep", ':grep! -F ""<Left>', { noremap = true, silent = true })

-- Clear search highlight (macOS Alt+H / Alt+-)
vim.keymap.set("n", "¬", ":nohlsearch<CR>", { noremap = true, silent = true }) -- Alt+H
vim.keymap.set("n", "–", ":nohlsearch<CR>", { noremap = true, silent = true }) -- Alt+-

-- Ctrl + - to dismiss notifications
vim.keymap.set("n", "", ":lua require('notify').dismiss()<CR>", { noremap = true, silent = true }) -- Ctrl+_

-- Dirvish config (optional)
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vimrc_group,
--   pattern = "dirvish",
--   callback = function()
--     vim.keymap.set("n", "t", 'ddO<Esc>:let @"=substitute(@", "\\n", "", "g")<CR>', { noremap = true, buffer = true })
--   end,
-- })
