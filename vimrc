call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'         " Auto close tags
Plug 'ap/vim-css-color'           " Colorize hexadecimal colors
Plug 'bling/vim-airline'
Plug 'christophermca/meta5'       " Best colorscheme`"
Plug 'ervandew/supertab'          " Perform all your vim insert mode completions with Tab
Plug 'matze/vim-move'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'    " Syntax support
Plug 'wellle/targets.vim'         " Modify faster (){}[] contents
Plug 'wincent/ferret'             " Enhanced multi-file search for Vim

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


call plug#end()

set shiftwidth=2    " Use indents of 2 spaces
set tabstop=2       " An indentation every four columns
set softtabstop=2   " Let backspace delete indent
set expandtab       " Convert tab to spaces
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O" command).
set ruler           " Show the line and column number of the cursor position, separated by a comma.
set mouse=a         " Enable the use of the mouse.
set incsearch       " While typing a search command, show immediately where the so far typed pattern matches.
set number          " Show line numbers.
set noerrorbells    " Shut up the beep
set vb              " Visual flash bell bell
set nocompatible    " Disable compatibility with vi
set laststatus=2    " Display the status line always
set shell=/bin/bash " Used shell for executed commands
set hlsearch        " To highlight all search matches
set nowrap          " Don't wrap lines
set backspace=indent,eol,start " Backspace options

" colorscheme
colorscheme meta5

filetype on               " Turn on filetype detection
filetype plugin indent on " Turn on indentation
syntax on                 " Turn on syntax on

scriptencoding utf-8
set encoding=utf-8

let mapleader=" "   " Sets the leader key

let g:move_key_modifier = 'C' " Move plugin

let g:fzf_buffers_jump = 1 " Disable jump to the existing window if possible

set switchbuf=vsplit " Split new buffer in quickfix

set list listchars=tab:.. " Display extra whitespace

" Undo file
set undofile
set undodir=~/.vim/undodir/

" Utilities
cab uniq %s/^\(.*\)\(\n\1\)\+$/\1/

" Decrease vim command timeout
set ttimeout
set ttimeoutlen=100

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=.git,.svn
set wildignore+=*.o,*.obj,*.jpg,*.png,*.gif,*.log,*.gz,*.bin,*.gem,*.rbc,*.class
set wildignore+=*.min.js,**/node_modules/**,**/images/**
set wildignore+=**/assets/**/original/**,**/assets/**/thumb/**,**/assets/**/small/**
set wildignore+=tmp,public,vendor/bundle/*,vendor/cache/*,test/fixtures/*,vendor/gems/*,spec/cov,a/*

" Delete without saving it to the registry. (Uses black hole registry)
noremap  x "_x
vnoremap  x "_x

" Remove the highlighted search after two esc
nnoremap <esc><esc> :noh<return><esc>

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1

" Set swap and backup directories outside your working directory
" the double slash path at the end allows you to avoid collisions
" opening files with the same name in different directories
set backupdir=~/.vim/tmpdir//,.
set directory=~/.vim/tmpdir//,.

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', '\.git']
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>

" Paste mode toggler
map <leader>p :set invpaste paste?<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" Neomake
autocmd! BufReadPost,BufWritePost * Neomake

let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
let g:neomake_ruby_rubocop_maker = { 'exe': 'bundle', 'args': ['exec', 'rubocop', '--format', 'emacs'] }
let g:neomake_ruby_reek_maker = { 'exe': 'bundle', 'args': ['exec', 'reek'] }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" FZF
let g:fzf_command_prefix = 'FZF'
let g:fzf_commits_log_options = '--pretty=oneline'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Javascript
let g:javascript_plugin_flow = 1 " flow support
let g:javascript_plugin_jsdoc = 1 " js docs support

" Nerdtree
let g:NERDTreeDirArrows=0

nnoremap <leader><space> :FZFFiles<cr>
nnoremap <leader>b :FZFBuffers<cr>

" Tell vim to remember certain things when we exit
set viminfo='10,\"100,:20,%,n~/.viminfo

" Typo aliases
:command WQ wq
:command Wa wa
:command Wq wq
:command W w
:command Q q
:command Qa qa
:command QA qa

" remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e
