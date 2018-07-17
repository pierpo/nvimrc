"""""""""""""""""""""""
" Initialization
"
scriptencoding utf-8
augroup vimrc
  autocmd!
augroup END

"""""""""""""""""""""""
" GENERAL SETTINGS
"
set scrolljump=5
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

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

" Disable spell checking
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

" Color column 80
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif

" Theme
syntax enable

" Vertical split for diffs
set diffopt+=vertical

" Allows to change buffer without saving it
set hidden

" Keep track of undos of previous sessions
set undofile

" Sets the current directory to the directory of the current file we are
" working on
" Useful to autocomplete relative paths
" set autochdir

" Fix orphan buffers of netrw
augroup fixnetrw
  autocmd FileType netrw setl bufhidden=delete
augroup END

" Tabulations for Makefile
augroup noexpandtabmakefile
  autocmd vimrc FileType make setlocal noexpandtab
augroup END

" Refresh syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Search for currently selected text using //
vnoremap // y/\V<C-R>"<CR>

" Leader key setting
let g:mapleader = ','

" Fix html indent
let g:html_indent_script1 = 'inc'
let g:html_indent_style1  = 'inc'
let g:html_indent_inctags = 'html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section'

" Enable spellcheck for markdown files
augroup markdownspell
  autocmd Filetype markdown set spell spelllang=en_us
augroup END

" Deactivate ex mode
" Still available with q:
nnoremap Q <nop>

" Excludes end of line character
" for example, y$ no longer copies the end of line
nmap $ g_

" Makes Y copy until the end of the line (but not the whole line)
nmap Y yg_

" Cursor line in insert mode
augroup cursorlineinsert
  autocmd InsertEnter,InsertLeave * set cul!
augroup END

" Auto expand ()
inoremap (<CR> (<CR>)<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap {,<CR> {<CR>},<C-c>O
inoremap {;<CR> {<CR>};<C-c>O
inoremap [<CR> [<CR>]<C-c>O
inoremap ({<CR> ({<CR>})<C-c>O

" Escape in terminal mode
" tnoremap <Esc> <C-\><C-n>

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Use Rg with :grep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" No json quote conceal
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""
" SHORTCUTS

function Conflicts()
  :cexpr system('git lconflicts') | copen
endfunction

" Move panes using C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nmap ç :cp<CR>
nmap à :cn<CR>

" Remap square brackets for azerty mac keyboard
map § [
map è ]
nnoremap gè g]

" Keep selection after re-indenting
vnoremap < <gv
vnoremap > >gv

map <Leader>ta :!tmux send-keys -t 0.1 C-c C-m C-p C-m<CR><CR>
map <Leader>tb :!tmux send-keys -t 0.2 C-c C-m C-p C-m<CR><CR>
map <Leader>tc :!tmux send-keys -t 0.3 C-c C-m C-p C-m<CR><CR>
map <Leader>td :!tmux send-keys -t 0.4 C-c C-m C-p C-m<CR><CR>

nnoremap <Leader>rg :Rg "<C-R><C-W>"<CR>
nnoremap <Leader>fbt :Tags '<C-R><C-W><CR>

" Find JSS Class to check for dead classes
nnoremap <Leader>fcl /classes.<C-R><C-W><CR>

" Map ,m to :make
nnoremap <Leader>mm :make<CR>

" Map ,gdd to disable buggy gitgutter
nnoremap <Leader>gdd :GitGutterDisable<CR>

" Fuzzy find path with ,gf (useful when a project uses absolute imports
" instead of relative)
map <Leader>gf :call fzf#vim#files('', {'options':'--query '.expand('<cfile>')})<CR>

" Create file with ,gF if it does not exist
map <Leader>gF :e <cfile><cr>

" <Ctrl-ç> (azerty) redraws the screen and removes any search highlighting.
nnoremap <silent>  :nohl<CR>
" <Ctrl--> (qwerty)
nnoremap <silent>  :nohl<CR>

" Update all buffers from disk
nnoremap <Leader>ub :bufdo e!<CR>

" Copy filename to system clipboard
nnoremap <Leader>cfn :set noautochdir<CR>:ProjectRootCD<CR>:let @+=@%<CR>:set autochdir<CR>
nnoremap <Leader>cfp :set noautochdir<CR>:ProjectRootCD<CR>:let @+="`" . @% . "`"<CR>:set autochdir<CR>
nnoremap <Leader>ccfp :set noautochdir<CR>:ProjectRootCD<CR>:let @+=@%<CR>:set autochdir<CR>

" Makes Ag search in project directory and not current directory
" let g:ag_working_path_mode = 'r'
let g:rg_derive_root = 1

let $FZF_DEFAULT_COMMAND= 'ag --hidden -g ""'

" Bind C-p to fzf
" nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>pp :GFiles<CR>
nnoremap <silent> <leader>; :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>ft :Tags<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles<CR>

"""""""""""""""""""""""""""
" PRETTIER

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'all'

nnoremap <Leader>p :Prettier<CR>

""""""""""""""""""""""""""
" GUTENTAGS
let g:gutentags_ctags_exclude = ['coverage', 'node_modules', 'assets', 'flow-coverage']

"""""""""""""""""""""""""""
" NEOMAKE FOR SYNTAX CHECKING
"
augroup neomakesyntax
  autocmd! vimrc BufWritePost * Neomake
augroup END
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['stylelint']
""""""""""""""""""""""""

""""""""""""""""""""""""
" C SPECIFICS
"
" Indentation for C files
augroup cindentgroup
  autocmd BufRead,BufNewFile   *.c setlocal sw=8
  autocmd BufRead,BufNewFile   *.h setlocal sw=8
  autocmd BufRead,BufNewFile   *.c setlocal tabstop=8
  autocmd BufRead,BufNewFile   *.h setlocal tabstop=8
augroup END

"""""""""""""""""""""""""
" Coffee specifics
"
augroup coffeeexpand
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
augroup END

"""""""""""""""""""""""""
" VIMUX
" https://blog.bugsnag.com/tmux-and-vim/

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"""""""""""""""""""""""""
"let g:used_javascript_libs = 'angularjs'
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""
" " SNIPPETS
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <C-j>     <Plug>(neosnippet_jump)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

augroup neosnippettab
  autocmd FileType neosnippet setlocal tabstop=2 noexpandtab
augroup END

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:gfm_syntax_emoji_conceal = 1

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

" let g:neosnippet#scope_aliases = {}
" let g:neosnippet#scope_aliases['javascript'] = 'html,javascript'

"""""""""""""""""""
" DEOPLETE
let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_complete_delay=150
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#_omni_patterns = {'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'], 'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'], 'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*']}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'

" Deactivate preview window
" set completeopt-=preview

" close preview window automatically
" augroup closepreviewwindow
"   autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" augroup END
""""""""""""""""""""""""
" VIM NOTES
let g:notes_directories = ['~/Notes']
vmap <Leader>ns :NoteFromSelectedText<CR>

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim'

Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'mattn/emmet-vim' " HTML plugin
Plug 'othree/html5.vim' "pour html5
Plug 'othree/html5-syntax.vim'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'bronson/vim-trailing-whitespace' "trailing whitespace plugin

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

" JS syntax highlight
Plug 'othree/yajs.vim'

Plug 'neomake/neomake'

Plug 'vim-ruby/vim-ruby'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-fugitive'

Plug 'alols/vim-love-efm'
Plug 'docteurklein/vim-symfony'

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Plug 'rking/ag.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround' " surround, to add surrounding characters around selection

Plug 'majutsushi/tagbar'

" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" CSS3 highlighting
Plug 'hail2u/vim-css3-syntax'

Plug 'pangloss/vim-javascript'

" Node
Plug 'moll/vim-node'

Plug 'elzr/vim-json'

Plug 'tpope/vim-commentary'

" Select by indent
Plug 'michaeljsmith/vim-indent-object'

" Github markdown
Plug 'rhysd/vim-gfm-syntax'

" React
Plug 'mxw/vim-jsx'

Plug 'jaawerth/neomake-local-eslint-first'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

Plug 'benmills/vimux'

Plug 'ludovicchabant/vim-gutentags'

" Split lines (like js objects)
Plug 'AndrewRadev/splitjoin.vim'

" More recent netrw
Plug 'eiginn/netrw'

"Colorscheme
Plug 'fcpg/vim-farout'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" :Gbrowse
Plug 'tpope/vim-rhubarb'

Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'

" Useful to use the :ProjectRootCD function :)
Plug 'dbakker/vim-projectroot'

" Close a buffer without closing the window
Plug 'rbgrouleff/bclose.vim'

" Switch true to false
Plug 'AndrewRadev/switch.vim'

" Cycle arguments/properties
Plug 'AndrewRadev/sideways.vim'

Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'

Plug 'tpope/vim-abolish'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required


" Sideways mappings
nnoremap <Leader>gh :SidewaysLeft<cr>
nnoremap <Leader>gl :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

"TODO
"try this
"junegunn/vim-easy-align

"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'

set background=dark

" let g:airline_theme='base16_ashes'
" colorscheme base16-ashes

" let g:airline_theme='onedark'
" colorscheme onedark

colorscheme gruvbox
" let g:airline_theme='gruvbox'

" let g:airline_theme='apprentice'
" colorscheme apprentice


" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'python': ['pyls'],
"     \ 'javascript': ['~/.bin/javascript-typescript-langserver/lib/language-server-stdio.js'],
"     \ 'javascript.jsx': ['~/.bin/javascript-typescript-langserver/lib/language-server-stdio.js'],
"     \ }

" let g:LanguageClient_diagnosticsEnable = 0

" nnoremap <Leader>lsp :LanguageClientStart<CR>
" nnoremap <Leader>gd  :call LanguageClient_textDocument_definition()<CR>
" nnoremap <Leader>rn  :call LanguageClient_textDocument_rename()<CR>


set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c\

""""""""""""""""""""""""
" Vim Airline
" let g:airline_powerline_fonts = 1
" let g:airline_section_b = ''
" let g:airline_section_x = ''
" let g:airline_section_y = ''
" " let g:airline_section_z = '%3p%% %3l/%L:%2v'
" let g:airline_section_z = '%3l/%L:%2v'
" let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ }

nnoremap <Leader>db yiWoconsole.log('<C-r>"', <C-r>")<esc>==
nnoremap <Leader>dB yiWOconsole.log('<C-r>"', <C-r>")<esc>==

" /usr/local/bin/python
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/Users/Pierpo/.pyenv/versions/neovim3/bin/python'

" FLOW
let g:javascript_plugin_flow = 1

" Switch
let g:switch_mapping = 'gs'




nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" " TYPESCRIPT SERVER
" let g:LanguageClient_serverCommands = {
" \ 'typescript': ['javascript-typescript-stdio'],
" \ }

" FLOW SERVER
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio'],
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ 'typescript': ['javascript-typescript-stdio'],
\ 'go': ['go-langserver'],
\ }

" Otherwise overrides the quickfix list used by :grep :'(
let g:LanguageClient_diagnosticsList = ''

let g:LanguageClient_rootMarkers = {
\ 'javascript': ['package.json'],
\ 'javascript.jsx': ['package.json'],
\ }


" (Optionally) automatically start language servers.
" let g:LanguageClient_autoStart = 1

let g:LanguageClient_diagnosticsList = 'Location'

nnoremap <silent> <Leader>K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Close preview on end of autocomplete
autocmd CompleteDone * silent! pclose!

" Fix broken <C-l> in netrw
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nnoremap <buffer> <c-l> :wincmd l<cr>
endfunction

" Always keep the gutter on the left
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
