set scrolljump=5
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

"""""""""""""""""""""""
" GENERAL SETTINGS

filetype on       " enable file type detection
syntax on         " syntax highlighting
filetype plugin on
filetype indent on

set termguicolors

" Allows to change buffer without saving it
set hidden

" Sets the current directory to the directory of the current file we are
" working on
" Useful to autocomplete relative paths
set autochdir

" Cursor line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Sets shell
set shell=/bin/bash

" Makes scrolling quicker
set lazyredraw

" Activates mouse
set mouse=a

" Numbers the lines
set nu

set smartindent   " smart code indentation
set smarttab      " smart tabs

set backspace=2

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

" Shows result of substitute commands like '%s/azer/azer' live
set inccommand=nosplit

" Don't split words when breaking lines
set linebreak

" Tabulations for Makefile
autocmd FileType make setlocal noexpandtab

" No json quote conceal
let g:vim_json_syntax_conceal = 0
"
" Deactivate ex mode
map q: <Nop>
nnoremap Q <nop>

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" Color column 80
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" Theme
syntax enable
autocmd VimEnter * colorscheme OceanicNext
autocmd VimEnter * AirlineRefresh
set background=dark
let g:airline_theme='oceanicnext'

"""
" Filetype syntax
au BufRead,BufNewFile *.shimple setfiletype java
au BufRead,BufNewFile *.shimple_test setfiletype java
au BufRead,BufNewFile *.z3 setfiletype lisp

""""""""""""""""""""""""
" SHORTCUTS
"

" Leader key setting
let mapleader = ","

" Map ,m to :make
nnoremap <Leader>mm :make<CR>

" Unfold/fold
nnoremap <Space> za

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Update all buffers from disk
nnoremap <Leader>ub :bufdo e!<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|\cache|\vendor|\coverage|node_modules|bower_components|dist|\vagrant-mssql-express$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Shortcut to change buffer
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

"""""""""""""""""""""""""""
" NEOMAKE FOR SYNTAX CHECKING
"
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
""""""""""""""""""""""""

""""""""""""""""""""""""
" C SPECIFICS
"
" Indentation for C files
autocmd BufRead,BufNewFile   *.c setlocal sw=8
autocmd BufRead,BufNewFile   *.h setlocal sw=8
autocmd BufRead,BufNewFile   *.c setlocal tabstop=8
autocmd BufRead,BufNewFile   *.h setlocal tabstop=8

"""""""""""""""""""""""""
" Coffee specifics
"
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"""""""""""""""""""""""""
let g:used_javascript_libs = 'angularjs'

""""""""""""""""""""""""
" Vim Airline
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" " SNIPPETS
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

"""""""""""""""""""
" DEOPLETE
let g:deoplete#enable_at_startup = 1

" Deactivate preview window
set completeopt-=preview

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" close preview window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"""""""""""""""""""

""""""""""""""
" SUPERTAB
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""

""""""""""""""""""""""""
" NERDTREE SETTINGS
"map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeMirrorToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" Add folder icons in NERD tree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Vim Notes
let g:notes_directories = ['~/Notes']
vmap <Leader>ns :NoteFromSelectedText<CR>

" VIM LATEX SETTINGS

" Permet de résoudre le prob :
" quand on lance un fichier .tex vide, lance également
" VimLaTeX
let g:tex_flavor='latex'

" Vim LaTeX
vmap ,b "zdi\textbf{<C-R>z}<ESC>
vmap ,e "zdi\emph{<C-R>z}<ESC>
vmap ,t "zdi\texttt{<C-R>z}<ESC>

" Override UltiSnips shortcut if LaTeX file
"autocmd FileType tex,latex imap <C-J> <Plug>IMAP_JumpForward
"
" Compile with LuaLaTex by default for PDF       
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'

" Sets default PDF reader
let g:Tex_ViewRule_pdf = 'Preview'



" ##################### VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim'

Plug 'vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-latex/vim-latex'

Plug 'tmhedberg/SimpylFold' " code folding in python
Plug 'zchee/deoplete-jedi' "completion python
Plug 'pbogut/deoplete-padawan' "completion php

" Snippets
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'mattn/emmet-vim' " HTML plugin
Plug 'othree/html5.vim' "pour html5
Plug 'othree/html5-syntax.vim'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'triglav/vim-visual-increment' "increment list of number
Plug 'bronson/vim-trailing-whitespace' "trailing whitespace plugin

Plug 'scrooloose/nerdtree' "NERDTree
Plug 'jistr/vim-nerdtree-tabs' "pour que NERDTree persiste d'un tab a l'autre

Plug 'ctrlpvim/ctrlp.vim' "ctrl p

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nanotech/jellybeans.vim' "color
Plug 'tomasr/molokai' "molokai color
Plug 'mhartington/oceanic-next'

" JS syntax highlight
Plug 'othree/yajs.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'lumiliet/vim-twig'
Plug 'neomake/neomake'

Plug 'vim-ruby/vim-ruby'

Plug 'kchmck/vim-coffee-script' "coffee script
Plug 'digitaltoad/vim-pug' "jade and pug
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'

Plug 'alols/vim-love-efm'
Plug 'docteurklein/vim-symfony'

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'Slava/tern-meteor'
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'mattn/emmet-vim'

Plug 'rking/ag.vim'

Plug 'vim-latex/vim-latex' " vim latex

Plug 'tpope/vim-surround' " surround, to add surrounding characters around selection

Plug 'majutsushi/tagbar'

"Plug 'christoomey/vim-tmux-navigator'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Local vimrc
Plug 'embear/vim-localvimrc'

" CSS3 highlighting
Plug 'hail2u/vim-css3-syntax'

" LESS highlighting
Plug 'groenewege/vim-less'

"" Angular
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'ervandew/supertab'

" Node
Plug 'moll/vim-node'

" Insert brackets automatically
"Plug 'jiangmiao/auto-pairs'

Plug 'elzr/vim-json'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required


"TODO
"try this
"junegunn/vim-easy-align
