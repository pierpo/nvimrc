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


"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " PYTHON SPECIFICS
"""" SAVE """" 
"""" SAVE """" " See docstring in python fold
"""" SAVE """" let g:SimpylFold_docstring_preview=1
"""" SAVE """" 
"""" SAVE """" " Python indentation
"""" SAVE """" " fix # comment issue
"""" SAVE """" set cindent
"""" SAVE """" 
"""" SAVE """" let python_highlight_all=1
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " VIM LATEX SETTINGS
"""" SAVE """" 
"""" SAVE """" " Permet de résoudre le prob :
"""" SAVE """" " quand on lance un fichier .tex vide, lance également
"""" SAVE """" " VimLaTeX
"""" SAVE """" let g:tex_flavor='latex'
"""" SAVE """" 
"""" SAVE """" " Vim LaTeX
"""" SAVE """" vmap ,b "zdi\textbf{<C-R>z}<ESC>
"""" SAVE """" vmap ,e "zdi\emph{<C-R>z}<ESC>
"""" SAVE """" vmap ,t "zdi\texttt{<C-R>z}<ESC>
"""" SAVE """" "
"""" SAVE """" " Compile with LuaLaTex by default for PDF       
"""" SAVE """" "let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'
"""" SAVE """" 
"""" SAVE """" " Sets default PDF reader
"""" SAVE """" let g:Tex_ViewRule_pdf = 'Preview'
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " NERDTREE SETTINGS
"""" SAVE """" 
"""" SAVE """" " When double-click or enter, open in current window
"""" SAVE """" let NERDTreeMapOpenInTab='\r'
"""" SAVE """" let NERDTreeMapOpenInTab='<ENTER>'
"""" SAVE """" 
"""" SAVE """" " Pour NERDTree avec tabs
"""" SAVE """" map <Leader>n :NERDTreeMirror<CR>
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " GIT SETTINGS
"""" SAVE """" 
"""" SAVE """" " Problème de couleur gitgutter
"""" SAVE """" highlight clear SignColumn
"""" SAVE """" highlight GitGutterAdd ctermfg=green
"""" SAVE """" highlight GitGutterChange ctermfg=yellow
"""" SAVE """" highlight GitGutterDelete ctermfg=red
"""" SAVE """" highlight GitGutterChangeDelete ctermfg=yellow
"""" SAVE """" 
"""" SAVE """" " So that the git diff split is vertical
"""" SAVE """" set diffopt+=vertical
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " YouCompleteMe SETTINGS
"""" SAVE """" 
"""" SAVE """" " Jump to definition with ,jd and YCM
"""" SAVE """" nnoremap <leader>jd :YcmCompleter GoTo<CR>
"""" SAVE """" 
"""" SAVE """" " Path to python
"""" SAVE """" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
"""" SAVE """" let g:ycm_autoclose_preview_window_after_completion = 1
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " UltiSnips SETTINGS
"""" SAVE """" " " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"""" SAVE """" " let g:UltiSnipsExpandTrigger="<c-j>"
"""" SAVE """" " let g:UltiSnipsJumpForwardTrigger="<c-b>"
"""" SAVE """" " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"""" SAVE """" " 
"""" SAVE """" " " If you want :UltiSnipsEdit to split your window.
"""" SAVE """" " let g:UltiSnipsEditSplit="vertical"
"""" SAVE """" " 
"""" SAVE """" 
"""" SAVE """" """"""""""""""""""""""""
"""" SAVE """" " Syntastic SETTINGS
"""" SAVE """" set statusline+=%#warningmsg#
"""" SAVE """" set statusline+=%{SyntasticStatuslineFlag()}
"""" SAVE """" set statusline+=%*
"""" SAVE """" 
"""" SAVE """" "let g:syntastic_always_populate_loc_list = 1
"""" SAVE """" "let g:syntastic_auto_loc_list = 1
"""" SAVE """" let g:syntastic_check_on_open = 1
"""" SAVE """" let g:syntastic_check_on_wq = 0
"""" SAVE """" 
"""" SAVE """" " Ignore the HTML error template not recognized
"""" SAVE """" let g:syntastic_html_tidy_ignore_errors = [ '<template> is not recognized!', 'discarding unexpected <template>', 'discarding unexpected </template>']
"""" SAVE """" 
"""" SAVE """" let g:syntastic_html_tidy_exec = 'tidy5'
"""" SAVE """" 
"""" SAVE """" 
"""" SAVE """" """""""""""""""""""""""""""
"""" SAVE """" " NO IDEA WHAT THOSE DO
"""" SAVE """" highlight Pmenu ctermfg=0 ctermbg=7 guifg=#ffffff guibg=#0000ff
"""" SAVE """" 
"""" SAVE """" set wildchar=<Tab> wildmenu wildmode=full


" Vim LighTLine (remplacement de Powerline)
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }


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


Plug 'mattn/emmet-vim' " HTML plugin
Plug 'othree/html5.vim' "pour html5

Plug 'scrooloose/syntastic'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'triglav/vim-visual-increment' "increment list of number

Plug 'scrooloose/nerdtree' "NERDTree
Plug 'jistr/vim-nerdtree-tabs' "pour que NERDTree persiste d'un tab a l'autre

Plug 'daylerees/colour-schemes', { 'rtp': 'vim/' } " Lots of colors


Plug 'itchyny/lightline.vim'

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
