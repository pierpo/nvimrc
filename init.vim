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
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'bronson/vim-trailing-whitespace' "trailing whitespace plugin

" Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'

" Split lines (like js objects)
Plug 'AndrewRadev/splitjoin.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
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

" Cycle arguments/properties
Plug 'AndrewRadev/sideways.vim'

" Filter the quickfix list
Plug 'romainl/vim-qf'

" Instead of gitgutter
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" nginx
Plug 'chr4/nginx.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" godot
Plug 'calviken/vim-gdscript3'

" Ranger
Plug 'kevinhwang91/rnvimr'

Plug 'neovim/nvim-lspconfig'
Plug 'kosayoda/nvim-lightbulb'
Plug 'hrsh7th/nvim-compe'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"""""""

Plug 'justinmk/vim-dirvish'

Plug 'mhartington/formatter.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'windwp/nvim-ts-autotag'

Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" }}}

" Generic configuration {{{
"

set scrolljump=5
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set foldmethod=marker

set wildignore+=*DS_Store*

if has('nvim-0.4.0')
  set wildoptions=pum
endif

filetype on       " enable file type detection
filetype plugin on
filetype indent on
syntax on         " syntax highlighting

" Sets shell
set shell=/bin/bash

" Makes scrolling quicker
" set lazyredraw

" Activates mouse
set mouse=a

" Numbers the lines
set number

set smartindent   " smart code indentation
set smarttab      " smart tabs

set backspace=2

" Disable spell checkinm
set nospell

" Search parameters
set ignorecase
set hlsearch
set incsearch

" Shows matching parenthesis
set showmatch

" Indentation methods
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

set laststatus=2

" Shows result of substitute commands live
set inccommand=nosplit

" Don't split words when breaking lines
set linebreak

" Necessary for colors
if (has('termguicolors'))
    set termguicolors
endif

" Theme
syntax enable

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

" Use Rg with :grep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Always keep the gutter on the left
augroup gutter
  autocmd BufRead,BufNewFile * setlocal signcolumn=yes
augroup END

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=4000

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

" Cursor line in insert mode
augroup cursorlineinsert
  autocmd InsertEnter,InsertLeave * set cul!
augroup END

" }}}

" Mappings {{{

nnoremap <leader>grep :grep! -F ""<LEFT>

" Makes Y copy until the end of the line (instead of the whole line)
nmap Y yg_

" Move panes using C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Refresh syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Search for currently selected text using //
vnoremap // y/\V<C-R>"<CR>

" Keep selection after re-indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>rg :grep! "<C-R><C-W>"<CR>
nnoremap <Leader>rge :grep! "\b<C-R><C-W>\b"<CR>
nnoremap <Leader>fbt :Tags '<C-R><C-W><CR>

" Fuzzy find path with ,gf (useful when a project uses absolute imports
" instead of relative)
map <Leader>gf :call fzf#vim#files('', {'options':'--query '.'\'''.expand('<cfile>')})<CR>

" Same but remove the first 4 characters (very specific: it's for a project that has weird js aliases)
map <Leader>ngf :call fzf#vim#files('', {'options':'--query '.'\'''.strpart(expand('<cfile>'), 4)})<CR>

" search for current file usage in ES6
map <Leader>fcf :execute ':grep! ".*from.*'. expand('%:t:r') .'[''\"].*"'<CR>

" Create file with ,gF if it does not exist
map <Leader>gF :e <cfile><cr>

nmap <Leader>gmove :Gmove <C-R>=expand('%:p')<CR>

" <Ctrl-ç> (azerty) redraws the screen and removes any search highlighting.
nnoremap <silent>  :nohl<CR>
" <Ctrl--> (qwerty)
nnoremap <silent>  :nohl<CR>
" <M--> (qwerty linux)
nnoremap <silent> <M--> :nohl<CR>

" Update all buffers from disk
nnoremap <Leader>ub :bufdo e!<CR>

" Copy filename to system clipboard
nnoremap <Leader>cfn :let @+=@%<CR>
" Copy filepath to system clipboard with `` (for Trello)
nnoremap <Leader>cfp :let @+="`" . @% . "`"<CR>

let $FZF_DEFAULT_COMMAND= 'rg --hidden --files'

nnoremap <silent> <leader>pp :GFiles<CR>
nnoremap <silent> <leader>; :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>ft :Tags<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Bind C-p to fzf
" Besides, execute it in the root directory of the project
" Actually, it's no use if noautochdir is set (but let's keep it anyway)
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles<CR>

nnoremap <Leader>w :Format<CR>:w<CR>
nnoremap <Leader>W :noautocmd w<CR>

" Auto expand ()
inoremap (<CR> (<CR>)<Up><End><CR>
inoremap {<CR> {<CR>}<Up><End><CR>
inoremap {,<CR> {<CR>},<Up><End><CR>
inoremap {;<CR> {<CR>};<Up><End><CR>
inoremap [<CR> [<CR>]<Up><End><CR>
inoremap ({<CR> ({<CR>})<Up><End><CR>
inoremap `<CR> `<CR>`<Up><End><CR>

inoremap (( ()<left>
inoremap {{ {}<left>
inoremap [[ []<left>
inoremap "" ""<left>
inoremap """ """<CR>"""<Up><End><CR>
inoremap ``` ```<CR>```<Up><End><CR>
inoremap '' ''<left>
inoremap `` ``<left>

" }}}

" Allow terminal split switch using C-HJKL {{{

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" }}}


" Snippets config {{{

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <C-j> <Plug>(neosnippet_jump)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

" Plugins config {{{

" Sideways mappings
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Switch mapping
let g:switch_mapping = 'gs'

let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

" Colorscheme {{{
" colorscheme OceanicNext
" colorscheme nvcode
colorscheme tokyonight
set background=dark
" }}}

" Fzf as popup window {{{
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 8
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'border': 'single',
        \ 'relative': 'editor',
        \ 'row': 4,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}

nnoremap <silent> + :RnvimrToggle<CR>

lua require('lsp')
lua require('treesitter-conf')
lua require('gitsigns-conf')
lua require('formatter-config')
lua require('lualine-conf')
lua require('telescope-config')
lua require('dap-config')

nnoremap gA <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
vnoremap ga <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>V
nnoremap <space>a <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <space>s <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>


augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
              \ nnoremap <silent><buffer> t ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
augroup END

" Lua colorizer
lua require'colorizer'.setup()
