"""""""""""""""""""""""
" GENERAL SETTINGS

filetype on       " enable file type detection
syntax on         " syntax highlighting
filetype plugin on
filetype indent on

" Sets shell
set shell=/bin/bash

" Highlights current line
set cursorline

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set noexpandtab

set laststatus=2

" Don't split words when breaking lines
set linebreak

" Tabulations for Makefile
autocmd FileType make setlocal noexpandtab
"
" Deactivate ex mode
map q: <Nop>
nnoremap Q <nop>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,f1,\"100,:20,%,n~/.viminfo

autocmd VimEnter * colorscheme jellybeans 


"""
" Filetype syntax
au BufRead,BufNewFile *.shimple setfiletype java
au BufRead,BufNewFile *.shimple_test setfiletype java
au BufRead,BufNewFile *.z3 setfiletype lisp


""""""""""""""""""""""""
" SHORTCUTS
"
" Map ,m to :make
nnoremap <Leader>m :make<CR>

" Unfold/fold
nnoremap <Space> za

" Leader key setting
let mapleader = ","

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Shortcut to change buffer
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>




""""""""""""""""""""""""
" C SPECIFICS
"
" Indentation for C files
autocmd BufRead,BufNewFile   *.c setlocal sw=8
autocmd BufRead,BufNewFile   *.h setlocal sw=8
autocmd BufRead,BufNewFile   *.c setlocal tabstop=8
autocmd BufRead,BufNewFile   *.h setlocal tabstop=8



" Vim LighTLine (remplacement de Powerline)
" let g:lightline = {
"       \ 'colorscheme': 'jellybeans',
"       \ }

" Vim Airline
let g:airline_powerline_fonts = 1

"##################
" DEOPLETE
let g:deoplete#enable_at_startup = 1

" close preview window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Show def for python
let deoplete#sources#jedi#show_docstring = 1

"##################


"#############
" SUPERTAB
let g:SuperTabDefaultCompletionType = "<c-n>"
"#############

""""""""""""""""""""""""
" NERDTREE SETTINGS

" When double-click or enter, open in current window
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'

" Pour NERDTree avec tabs
map <Leader>nt :NERDTreeToggle<CR>

" Ouvrir au lancement
"autocmd VimEnter * NERDTree
"autocmd BufWinEnter * NERDTreeMirror


""""""""""""""""""""""""""""""""""""""""""""""""
" " SNIPPETS
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" 
" " SuperTab like snippets behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" 
" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
" 
" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" 
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="Ï" "MAC ONLY
let g:UltiSnipsJumpForwardTrigger="î"
let g:UltiSnipsJumpBackwardTrigger="º"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsListSnippets="œ"
" """"""""""""""""""""""""""""""""""""""""""""""""


" ##################### VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/plugged
call plug#begin('~/.config/nvim/plugged')
"call plug#begin("./config/nvim/bundle")
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plug 'VundleVim/Vundle.vim'

" Track the engine.
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
"
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'

Plug 'vim-gitgutter'
Plug 'vim-latex/vim-latex'

Plug 'tmhedberg/SimpylFold' " code folding in python
Plug 'zchee/deoplete-jedi' "completion python

" UltiSnips
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim' " HTML plugin
Plug 'othree/html5.vim' "pour html5

Plug 'scrooloose/syntastic'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'triglav/vim-visual-increment' "increment list of number

Plug 'scrooloose/nerdtree' "NERDTree
Plug 'jistr/vim-nerdtree-tabs' "pour que NERDTree persiste d'un tab a l'autre

Plug 'ctrlpvim/ctrlp.vim' "ctrl p


" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'daylerees/colour-schemes', { 'rtp': 'vim/' } " Lots of colors
Plug 'nanotech/jellybeans.vim' "color
Plug 'tomasr/molokai' "molokai color
Plug 'alols/vim-love-efm'
Plug 'scwood/vim-hybrid' "color
Plug 'mhinz/vim-janah' "color
Plug 'easysid/mod8.vim' "color
Plug 'AlessandroYorba/Sierra' "color
Plug 'altercation/vim-colors-solarized' "color
Plug 'kocakosm/hilal' "color
Plug 'vim-scripts/obsidian2.vim' "color
Plug 'tomasr/molokai' "molokai color
Plug 'alols/vim-love-efm'
Plug 'scwood/vim-hybrid' "color
Plug 'mhinz/vim-janah' "color
Plug 'easysid/mod8.vim' "color
Plug 'AlessandroYorba/Sierra' "color
Plug 'altercation/vim-colors-solarized' "color
Plug 'kocakosm/hilal' "color
Plug 'vim-scripts/obsidian2.vim' "color

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
