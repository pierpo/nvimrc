set scrolljump=5
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

"""""""""""""""""""""""
" GENERAL SETTINGS
"

" Rg vim grep
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Enable spellcheck for markdown files
autocmd Filetype markdown set spell spelllang=en_us

filetype on       " enable file type detection
syntax on         " syntax highlighting
filetype plugin on
filetype indent on

" Allows to change buffer without saving it
set hidden

"imap jk <Esc>

" Excludes end of line character
" for example, y$ no longer copies the end of line
nmap $ g_

" Makes Y copy until the end of the line (but not the whole line)
nmap Y yg_

" Sets the current directory to the directory of the current file we are
" working on
" Useful to autocomplete relative paths
set autochdir

" Cursor line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Auto expand ()
inoremap (<CR> (<CR>)<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [<CR> [<CR>]<C-c>O

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

" Shows result of substitute commands live
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

" Necessary for colors
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


"""
" Filetype syntax
au BufRead,BufNewFile *.shimple setfiletype java
au BufRead,BufNewFile *.shimple_test setfiletype java
au BufRead,BufNewFile *.z3 setfiletype lisp

""""""""""""""""""""""""
" SHORTCUTS

" Move panes using C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Leader key setting
let mapleader = ","

nmap ç :cp<CR>
nmap à :cn<CR>

" Remap square brackets for azerty mac keyboard
nnoremap § [
nnoremap è ]
nnoremap ° ,

" Keep selection after re-indenting
vnoremap < <gv
vnoremap > >gv

" Map ,m to :make
nnoremap <Leader>mm :make<CR>

" Map ,gdd to disable buggy gitgutter
nnoremap <Leader>gdd :GitGutterDisable<CR>

" Unfold/fold
nnoremap <Space> za

" <Ctrl-ç> (azerty) redraws the screen and removes any search highlighting.
nnoremap <silent>  :nohl<CR>

" Update all buffers from disk
nnoremap <Leader>ub :bufdo e!<CR>

" Vertical split for diffs
set diffopt+=vertical

" Makes Ag search in project directory and not current directory
let g:ag_working_path_mode = 'r'

" Bind C-p to fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>ft :Tags<CR>

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

" Display buffer name
let g:airline#extensions#tabline#enabled = 1

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

let g:gfm_syntax_emoji_conceal = 1

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/'

" let g:neosnippet#scope_aliases = {}
" let g:neosnippet#scope_aliases['javascript'] = 'html,javascript'

"""""""""""""""""""
" DEOPLETE
let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_complete_delay=150

" Deactivate preview window
set completeopt-=preview

" close preview window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"""""""""""""""""""

""""""""""""""
" SUPERTAB
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""""""""""""
" NERDTREE SETTINGS
"map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeMirrorToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" Add folder icons in NERD tree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

""""""""""""""""""""""""
" VIM NOTES
let g:notes_directories = ['~/Notes']
vmap <Leader>ns :NoteFromSelectedText<CR>

" ##################### VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim'

Plug 'vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

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

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

Plug 'mattn/emmet-vim'

Plug 'rking/ag.vim'
Plug 'jremmen/vim-ripgrep'

Plug 'tpope/vim-surround' " surround, to add surrounding characters around selection

Plug 'majutsushi/tagbar'

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

Plug 'easymotion/vim-easymotion'

" Insert brackets automatically
"Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

Plug 'elzr/vim-json'

Plug 'tpope/vim-commentary'

" Select by indent
Plug 'michaeljsmith/vim-indent-object'

" Many languages support
Plug 'sheerun/vim-polyglot'

" Vim lion, similar to tabularize but quicker shortcuts
Plug 'tommcdo/vim-lion'

" Colors
Plug 'nanotech/jellybeans.vim' "color
Plug 'tomasr/molokai' "molokai color
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'

" Github markdown
Plug 'rhysd/vim-gfm-syntax'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required


"TODO
"try this
"junegunn/vim-easy-align

"colorscheme OceanicNext
colorscheme base16-ashes

set background=dark
let g:airline_theme='base16_ashes'
