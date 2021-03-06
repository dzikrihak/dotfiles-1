" Set the shell to bash if using vim
if &shell =~# 'fish$'
    set shell=bash
endif

set encoding=utf-8              " Necessary to show Unicode glyphs
set showmode                    " always show what mode we're currently editing in
filetype plugin indent on       " allows filetype detection
set nocompatible                " be iMproved, required

" Enable syntax processing
syntax on
syntax enable


" Tabs vs Spaces
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " a tab is four spaces when editing
set expandtab                   " <tab> becomes a shortcut for 'insert four spaces'

" Visual Settings
set number                      " show line numbers
set relativenumber              " shows numbers relative to the current line
set showcmd                     " show the very last command in the bottom right
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smartindent
set hlsearch                    " Hightlight words during search
set showmatch                   " Always show matching parenthesis when one is hightlighted
set lazyredraw                  " redraw only when we need to
set shiftwidth=4                " number of spaces to use for autoindenting
set textwidth=80                " Maximum width of the editor
set colorcolumn=80              " set a colored column to avoid going too far to the right

set hidden
set history=100

set splitright                  " create a new split to the right when calling :new
set splitbelow                  " same as above but for horizontal splits
set clipboard+=unnamedplus

" Ignore swp pyc and other python(ish) related files
set wildignore="*.swp, *.pyc, *.o"

" Change terminal title
set title

" Lazy redrawing when executing macros
set lazyredraw

" If on mac vim bump the font size and set the font to monaco
if has("gui_running")
    set guifont=Monaco:h16
    colorscheme inkpot

else
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set termguicolors
    colorscheme neuromancer
endif

" Airline theme
let g:airline_theme='luna'

" ignore node_modules x DS_Store x git in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env\|__pycache__'

" Fix indentation issues in YAML config files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml  setlocal ts=2 sts=2 sw=2 expandtab

" Make the quickfix window automatically appear if :make has any errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" ** - General vim config - **

set magic " for regex

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Useful mappings for managing tabs

" map leader key to <space>
let mapleader=" "

inoremap jk <ESC>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" enable fast saving of files using <space> w
nmap <leader>w :w!<cr>

" write quit easily using <space> q
nmap <leader>q :wq!<cr>

" source .vimrc using <space> s
map <leader>s :source ~/.vimrc<CR>

" Ignore .pyc files in nerdtree
let NERDTreeIgnore = ['\.pyc$']

" toggle NERDTree with <space> n
nmap <leader>n :NERDTreeToggle<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Cancel a search with escape
map <leader>/ :nohlsearch<CR>

" Enable folding with the spacebar
" nnoremap <space> za
nnoremap Q <nop>

" Explicitly use pylint to check python syntax
let g:syntastic_python_checkers = ['pylint']

" Disable Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Easier split navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ** - Markdown shizzle - **

" set .md files type to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" markdown language support
let g:markdown_fenced_languages = ['c', 'sql', 'html', 'python', 'bash=sh', 'javascript', 'css', 'sass']
let g:markdown_syntax_conceal = 0

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugin management using junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'hail2u/vim-css3-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'mxw/vim-jsx'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'fatih/vim-go'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'mitsuhiko/vim-jinja', { 'for': 'jinja2' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-markdown'
Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'

call plug#end()

" ** - Python settings - **
let python_highlight_all=1

" set indentation settings for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Set *.sql files to pgsql syntax highlighting
let g:sql_type_default = 'pgsql'

" Add syntax highlighting for vue react angular jquery lodash d3 etc
let g:used_javascript_libs = 'underscore, angularjs, jquery, d3, vue, react, flux, chai, handlebars'

" ft_plugin
if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=#CD5C5C

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Show syntax highlighting groups for word under cursor
nmap <leader>b :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
