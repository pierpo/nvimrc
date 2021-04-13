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

" HTML
Plug 'mattn/emmet-vim' " HTML plugin
Plug 'othree/html5.vim' "pour html5
Plug 'othree/html5-syntax.vim'

Plug 'godlygeek/tabular' "align stuff plugin
Plug 'bronson/vim-trailing-whitespace' "trailing whitespace plugin

Plug 'itchyny/lightline.vim'

Plug 'vim-ruby/vim-ruby'

" CSS3 highlighting
Plug 'hail2u/vim-css3-syntax'

" JavaScript
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'neoclide/jsonc.vim'

" Better `gf` for node
Plug 'tomarrell/vim-npr'

" Allows proper jsx commenting
" Plug 'suy/vim-context-commentstring'

" React
Plug 'mxw/vim-jsx'

" Styled components
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Typescript
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

Plug 'elzr/vim-json'

" Github markdown
Plug 'rhysd/vim-gfm-syntax'

" Plug 'ludovicchabant/vim-gutentags'

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
Plug 'mhartington/oceanic-next'

" Cycle arguments/properties
Plug 'AndrewRadev/sideways.vim'

" Go
" Plug 'fatih/vim-go'

" Filter the quickfix list
Plug 'romainl/vim-qf'

" Instead of gitgutter
Plug 'mhinz/vim-signify'

" nginx
Plug 'chr4/nginx.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" godot
Plug 'calviken/vim-gdscript3'

" colorscheme for treesitter
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

" Ranger
Plug 'kevinhwang91/rnvimr'

Plug 'neovim/nvim-lspconfig'
Plug 'mhartington/formatter.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'hrsh7th/nvim-compe'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"""""""

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

" Fixes issue with typescript syntax
" https://github.com/leafgarland/typescript-vim/issues/184
hi link typescriptReserved Keyword

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

function ClearPaneAndRepeatCommand(pane)
  execute '!tmux send-keys -t ' . '0.2' . ' -R \; clear-history'
  execute '!tmux send-keys -t ' . '0.2' . ' C-c C-m C-l C-p C-m'
endfunction

map <Leader>ta :!tmux send-keys -t 0.1 C-c C-m C-p C-m<CR><CR>
map <Leader>tka :execute ClearPaneAndRepeatCommand(0.1)<CR><CR>
map <Leader>tb :!tmux send-keys -t 0.2 C-c C-m C-p C-m<CR><CR>
map <Leader>tkb :execute ClearPaneAndRepeatCommand(0.2)<CR><CR>
map <Leader>tc :!tmux send-keys -t 0.3 C-c C-m C-p C-m<CR><CR>
map <Leader>tkc :execute ClearPaneAndRepeatCommand(0.3)<CR><CR>
map <Leader>td :!tmux send-keys -t 0.4 C-c C-m C-p C-m<CR><CR>
map <Leader>tkd :execute ClearPaneAndRepeatCommand(0.4)<CR><CR>

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

nnoremap <Leader>db yiWoconsole.log('<C-r>"', <C-r>")<esc>==
nnoremap <Leader>dB yiWOconsole.log('<C-r>"', <C-r>")<esc>==

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

" FLOW SYNTAX
let g:javascript_plugin_flow = 1

let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:gfm_syntax_emoji_conceal = 1

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

let g:jsx_ext_required = 0

" No json quote conceal
let g:vim_json_syntax_conceal = 0

" Gutentags
let g:gutentags_ctags_exclude = ['coverage', 'node_modules', 'assets', 'flow-coverage']

" Vim signify text objects
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

let g:signify_vcs_list = ['git']

" Colorscheme {{{
" colorscheme OceanicNext
colorscheme nvcode
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
        \ 'relative': 'editor',
        \ 'row': 4,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}

" Make firenvim never trigger so it has to be manually activated
let g:firenvim_config = {
  \ 'localSettings': {
    \ '.*': {
      \ 'selector': '',
      \ 'priority': 0,
    \ },
  \ }
\ }

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
EOF

nnoremap <silent> + :RnvimrToggle<CR>



lua require('lsp')

nnoremap gA <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
vnoremap ga <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>
nnoremap <space>a <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <space>s <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>

