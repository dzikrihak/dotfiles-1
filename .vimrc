set nocompatible                " be iMproved, required
set encoding=utf-8              " Necessary to show Unicode glyphs
set showmode                    " always show what mode we're currently editing in
set tabstop=4                   " a tab is four spaces
set softtabstop=4
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smartindent
set shiftwidth=4                " number of spaces to use for autoindenting
set number
set expandtab
set relativenumber
set textwidth=90
set t_Co=256
set term=screen-256color
set hlsearch                    " Hightlight words during search
set showmatch                   " Always show matching parenthesis when one is hightlighted
set hidden
set history=100
filetype on                     " required
syntax on
syntax enable
set background=dark
colorscheme seattle



" Change map key
let mapleader=" "


" Disable Typescript indentation
let g:typescript_indent_disable = 1

" Make the quickfix window automatically appear if :make has any errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" Reload vim config without restart
map <leader>s :source ~/.vimrc<CR>


" NERDTree Config
let NERDTreeIgnore = ['\.pyc$']
nmap <leader>n :NERDTreeToggle<CR>


" Enable folding
set foldmethod=indent
set foldlevel=99

" set a colored column to avoid going too far to the right
set colorcolumn=90

" Cancel a search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Enable folding with the spacebar
nnoremap <space> za
nnoremap Q <nop>

" Markdown Ish
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'css', 'sass']
let g:markdown_syntax_conceal = 0

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'ReplaceWithRegister'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'SirVer/ultisnips'
Plugin 'digitaltoad/vim-pug'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-markdown'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'chriskempson/base16-vim'
Plugin 'hdima/python-syntax'
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'noah/vim256-color'
Plugin 'leafgarland/typescript-vim'
Plugin 'elzr/vim-json'


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

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
