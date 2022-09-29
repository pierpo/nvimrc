" This .vimrc is meant for neovim
" most plugins won't work, and neovim default settings have been removed

" Initialization {{{
"
scriptencoding utf-8
augroup vimrc
  autocmd!
augroup END

" }}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

if has('macunix')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'bronson/vim-trailing-whitespace' "trailing whitespace plugin

" Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'

" Split lines (like js objects)
Plug 'AndrewRadev/splitjoin.vim'

Plug 'tpope/vim-surround'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" :Gbrowse
Plug 'tpope/vim-rhubarb'

Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'kana/vim-textobj-line'

" Select by indent
Plug 'michaeljsmith/vim-indent-object'

" Remap [[ and ]] to make it work properly with most filetypes
Plug 'arp242/jumpy.vim'

" Switch true to false
Plug 'AndrewRadev/switch.vim'

" Colorschemes
" Plug 'arcticicestudio/nord-vim'
" Plug 'AlessandroYorba/Sierra'
" Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'

" colorscheme for treesitter
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim'

" Cycle arguments/properties
Plug 'AndrewRadev/sideways.vim'

" Filter the quickfix list
Plug 'romainl/vim-qf'

" Instead of gitgutter
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Git conflicts
Plug 'akinsho/git-conflict.nvim'

" nginx
Plug 'chr4/nginx.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Ranger
Plug 'kevinhwang91/rnvimr'

Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" Icons for nvim cmp
Plug 'onsails/lspkind-nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"""""""

Plug 'justinmk/vim-dirvish'

Plug 'mhartington/formatter.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'jose-elias-alvarez/typescript.nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Plug 'simrat39/symbols-outline.nvim'

" Useful for ANSI colors on log dumps
Plug 'norcalli/nvim-terminal.lua'

" Override vim ui
Plug 'stevearc/dressing.nvim'

Plug 'rcarriga/nvim-notify'

Plug 'numToStr/Comment.nvim'

" All of your Plugins must be added before the following line
call plug#end()

" }}}

" Generic configuration {{{
"

set scrolljump=5
syntax sync minlines=256
set foldmethod=marker

set wildignore+=*DS_Store*

set wildoptions=pum

" Activates mouse
set mouse=a

" Numbers the lines
set number

set smartindent   " smart code indentation
set smarttab      " smart tabs

" Disable spell checkinm
set nospell

" Shows matching parenthesis
set showmatch

" Indentation methods
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" Shows result of substitute commands live
set inccommand=nosplit

" Don't split words when breaking lines
set linebreak

" Show character when line is wrapped
set showbreak=↳\ 

" Necessary for colors
if (has('termguicolors'))
    set termguicolors
endif

" Vertical split for diffs
set diffopt+=vertical

" Allows to change buffer without saving it
set hidden

" Keep track of undos of previous sessions
set undofile

" Leader key setting
let g:mapleader = ','

" Fix html indent
let g:html_indent_script1 = 'inc'
let g:html_indent_style1  = 'inc'
let g:html_indent_inctags = 'html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section'

" Error format for eslint
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m

" Error format for tsc
" set errorformat+=%f(%l,%c):\ %trror\ TS%n:\ %m
set errorformat+=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Close preview on end of autocomplete
autocmd CompleteDone * silent! pclose!

if has('macunix')
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
else
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif

" }}}

" Mappings {{{

" {{{ Defaults override
" Makes Y copy until the end of the line (instead of the whole line)
nmap Y yg_

" Keep selection after re-indenting
vnoremap < <gv
vnoremap > >gv
" }}}

" {{{ Local search highlighting
" <Ctrl-ç> (azerty) redraws the screen and removes any search highlighting.
nnoremap <silent>  :nohl<CR>
" <Ctrl--> (qwerty)
nnoremap <silent>  :nohl<CR>
" <M--> (qwerty linux)
nnoremap <silent> <M--> :nohl<CR>
" }}}

" {{{ Copy stuff to clipboard
" Copy filename to system clipboard
nnoremap <Leader>cfn :let @+=@%<CR>
" Copy filepath to system clipboard with `` (for Trello)
nnoremap <Leader>cfp :let @+="`" . @% . "`"<CR>
" }}}

" {{{ Save and format
nnoremap <Leader>w :Format<CR>:w<CR>
nnoremap <Leader>W :noautocmd w<CR>
" }}}

" }}}

" Move across panes using <C-HJKL> {{{

" Normal
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Terminal
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" }}}

" {{{ Project search

" Use Rg with :grep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

nnoremap <Leader>rg :grep! "<C-R><C-W>"<CR>

" Search for currently selected text using //
vnoremap // y/\V<C-R>"<CR>

nnoremap <leader>grep :grep! -F ""<LEFT>
" }}}

" Snippets config {{{

" press <C-k> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><C-k> <Plug>luasnip-expand-or-jump
" -1 for jumping backwards.
inoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" }}}

" Plugins config {{{

" Disable netrw
let loaded_netrwPlugin = 1

" {{{ Sideways mappings
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
" }}}

" {{{ Switch mapping
let g:switch_mapping = 'gs'
" }}}

" {{{ vim-qf
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0
" }}}

" Colorscheme {{{
" See colorscheme lua file
" }}}

" {{{ RnVimr
nnoremap <silent> + :RnvimrToggle<CR>
" }}}

" {{{ Fzf
let $FZF_DEFAULT_COMMAND= 'rg --hidden --files'

" Fuzzy find path with ,gf (useful when a project uses absolute imports
" instead of relative)
map <Leader>gf :call fzf#vim#files('', {'options':'--query '.'\'''.expand('<cfile>')})<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Bind C-p to fzf
" Besides, execute it in the root directory of the project
" Actually, it's no use if noautochdir is set (but let's keep it anyway)
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <A-p> :Files<CR>
nnoremap <silent> π :Files<CR>

nnoremap <silent> <leader>; :Buffers<CR>
" }}}

" {{{ Lua plugins
lua require('lsp')
lua require('treesitter-conf')
lua require('gitsigns-conf')
lua require('formatter-config')
lua require('colorscheme-and-lualine')
lua require('telescope-config')
lua require('dap-config')
lua require('autopairs-config')
lua require'colorizer'.setup()
lua require'terminal'.setup()
lua require("snippets-config")
lua require'git-conflict'.setup()
lua require'notify-config'
" }}}

" {{{ Dirvish
augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
              \ nnoremap <silent><buffer> t ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
augroup END
" }}}

" }}}

