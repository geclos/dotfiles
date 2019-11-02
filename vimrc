call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'                " Transform oneliners into multiple lines of code
Plug 'FooSoft/vim-argwrap'                      " Argument wrapping and unwrapping
Plug 'Valloric/MatchTagAlways'                  " Highlights matching html tags
Plug 'alvan/vim-closetag'                       " Auto close html/xml tags
Plug 'jremmen/vim-ripgrep'                      " Global grep, faster than usual grep
Plug 'ap/vim-css-color'                         " Colorize hexadecimal colors
Plug 'bling/vim-airline'                        " Fancy status bar
Plug 'brooth/far.vim'                           " Find and replace in the whole project
Plug 'ervandew/supertab'                        " Perform all your vim insert mode completions with Tab
Plug 'jgdavey/vim-blockle'                      " Switch between do/end and {} blocks in Ruby
Plug 'jnurmine/Zenburn'                         " Zenburn colorscheme
Plug 'kana/vim-smartinput'                      " Auto close {])\"'
Plug 'matze/vim-move'                           " Move lines easily
Plug 'scrooloose/nerdtree'                      " File tree
Plug 'sheerun/vim-polyglot'                     " Add language support for many languages
Plug 'tpope/vim-commentary'                     " Helpers for easy code comments
Plug 'tpope/vim-endwise'                        " Add end keyword in Ruby methods
Plug 'tpope/vim-fugitive'                       " Git goodies
Plug 'tpope/vim-surround'                       " Surround helpers
Plug 'w0rp/ale'                                 " Linter
Plug 'tpope/vim-abolish'                        " Automated substitutions for words I write incorrectly 50% of the time

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FZF
Plug 'junegunn/fzf.vim' " FZF

call plug#end()

set shiftwidth=2    " Use indents of 2 spaces
set tabstop=2       " An indentation every four columns
set softtabstop=2   " Let backspace delete indent
set expandtab       " Convert tab to spaces
set autoindent      " Copy indent from current line when starting a new line
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
colorscheme zenburn

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

" Set swap and backup directories outside your working directory
" the double slash path at the end allows you to avoid collisions
" opening files with the same name in different directories
set backupdir=~/.vim/tmpdir//,.
set directory=~/.vim/tmpdir//,.

" ALE {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_linters = {
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'typescript': ['tsserver'],
      \ 'javascript': ['eslint', 'flow'],
      \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \}

nnoremap <silent><leader>lf :ALEFix<CR>
nnoremap <silent><leader>ld :ALEDetail<CR>
nnoremap <silent><leader>lo :lopen<CR>
nnoremap <silent><leader>lc :lclose<CR>
"}}}

" NERDTree configuration
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\.rbc$', '\~$', '\.git']
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>

" Paste mode toggler
map <leader>p :set invpaste paste?<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" FZF
let g:fzf_command_prefix = 'FZF'
let g:fzf_commits_log_options = '--pretty=oneline'
let $FZF_DEFAULT_COMMAND = 'ag --ignore node_modules -g ""'

nnoremap <leader><space> :FZFFiles<cr>
nnoremap <leader>b :FZFBuffers<cr>

" Argwrap mapping
nnoremap <silent> <leader>a :ArgWrap<CR>

" RipGrep mapping
nnoremap <leader>s :Rg<cr>

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

" Enable MatchTagAlways in the following file types
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'jinja' : 1,
    \ 'jsx' : 1,
    \ 'tsx' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'

" Disables auto-close if not in a valid region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" set text width to 80 columns for markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
