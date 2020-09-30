call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'                " Transform oneliners into multiple lines of code
Plug 'FooSoft/vim-argwrap'                      " Argument wrapping and unwrapping
Plug 'Valloric/MatchTagAlways'                  " Highlights matching html tags
Plug 'altercation/vim-colors-solarized'         " Solarized color scheme
Plug 'alvan/vim-closetag'                       " Auto close html/xml tags
Plug 'ap/vim-css-color'                         " Colorize hexadecimal colors
Plug 'bling/vim-airline'                        " Fancy status bar
Plug 'brooth/far.vim'                           " Find and replace in the whole project
Plug 'dracula/vim', { 'as': 'dracula' }         " Dracula color scheme
Plug 'ervandew/supertab'                        " Perform all your vim insert mode completions with Tab
Plug 'janko/vim-test'                           " Run tests from vim
Plug 'jremmen/vim-ripgrep'                      " Global grep, faster than usual grep
Plug 'kana/vim-smartinput'                      " Auto close {])\"'
Plug 'majutsushi/tagbar'                        " Tells you what function you are in in the taskbar
Plug 'matze/vim-move'                           " Move lines easily
Plug 'rakr/vim-one'                             " One color scheme
Plug 'scrooloose/nerdtree'                      " File tree
Plug 'sheerun/vim-polyglot'                     " Support for many languages
Plug 'tpope/vim-abolish'                        " Automated substitutions for words I write incorrectly 50% of the time
Plug 'tpope/vim-commentary'                     " Helpers for easy code comments
Plug 'tpope/vim-dispatch'                       " Dispatch tests from vim
Plug 'tpope/vim-endwise'                        " Add end keyword in Ruby methods
Plug 'tpope/vim-fugitive'                       " Git goodies
Plug 'tpope/vim-surround'                       " Surround helpers
Plug 'w0rp/ale'                                 " Linter
Plug 'wellle/targets.vim'                       " Enhancements to Vim's text selection

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FZF
Plug 'junegunn/fzf.vim' " FZF

call plug#end()

set exrc            " Execute local vimrc files
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
set termguicolors

filetype on               " Turn on filetype detection
filetype plugin indent on " Turn on indentation
syntax on                 " Turn syntax on

" Characters encoding
set encoding=utf-8
scriptencoding utf-8

" Color scheme
set background=dark

" let g:dracula_italic = 0
" colorscheme dracula
" colorscheme solarized
"
" HACK: This is a hack to make One theme work inside Tmux
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
" HACK: End of hack
colorscheme one

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
      \ 'ruby': ['rubocop', 'sorbet'],
      \ 'typescript': ['eslint', 'tsserver'],
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
:command Wqa wqa
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

" configure Far to use ripgrep
let g:far#source = 'rg'
let g:far#window_layout = 'tab'

" Vim test
let test#strategy='dispatch'

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>to :Copen<CR>

" Vim splitjoin
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" airline configuration
let g:airline#extensions#ale#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " Don't display encoding unless it is unexpected
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" Use abbreviations to display modes
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S'
      \ }

set secure                                        " Prevents local vimrc files to automatically execute commands with autocmd
autocmd BufRead,BufNewFile *.md setlocal spell    " Spell checking in markdown files

nnoremap <C-d> }
nnoremap <C-u> {
