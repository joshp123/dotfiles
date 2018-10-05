set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tpope/vim-fugitive'   "Git stuff
Plugin 'ctrlpvim/ctrlp.vim'  "opening stuff
Plugin 'nvie/vim-flake8'  "linting
Plugin 'vim-airline/vim-airline' "that bar in the bottom
Plugin 'vim-airline/vim-airline-themes' "that bar in the bottom
Plugin 'scrooloose/nerdtree'  "tree view
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'airblade/vim-gitgutter'  " vim on the side
Plugin 'tomasr/molokai'  "theme
" Plugin 'neomake/neomake'  "some async make thing
" Plugin 'dojoteef/neomake-autolint'   "aasync linting
Plugin 'Yggdroot/indentLine'  " show indentation with lines
Plugin 'fatih/vim-go'

Plugin 'hashivim/vim-terraform'

Plugin 'ambv/black'

Plugin 'jamessan/vim-gnupg'

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

set autoindent
set smartindent
set encoding=utf-8
set wildmode=list:longest
set wildignore=*.pyc,__pycache_,node_modules/*,bower_components/*
set ts=4
set sw=4
set ls=2
set ai
set si
set incsearch
set expandtab
set number
set nowrap
set ruler
syntax on
set colorcolumn=80
set guioptions=egmt
set so=5
set lcs=tab:>-,trail:-
set list

set foldmethod=indent
set foldlevel=99

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" Enable solarized after pathogen, because of pluginloading
if !exists('colours')
    colorscheme molokai
    set bg=dark
endif

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

set bg=dark

" Clearly this only works with airline enabled with powerline fonts
let g:airline_powerline_fonts = 1

autocmd BufWritePost *.py call Flake8()
autocmd BufNewFile,BufRead *.mako set filetype=html
autocmd BufNewFile,BufRead *.cfc set noexpandtab
autocmd BufNewFile,BufRead *.cfc set nolist
autocmd BufNewFile,BufRead *.cfm set noexpandtab

nmap <F6> :TagbarToggle<CR>

" airline
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:terraform_fmt_on_save = 1

nnoremap <C-n> :bnext<CR>
:map <F5> :%! python -mjson.tool<CR>
:map <F6> :vertical resize 90<CR>

let g:ctrlp_custom_ignore = {'dir': '\v[\/](\.(git|hg|svn|dist)|node_modules|bower_components|WEB-INF|build|dist)$' }
let g:ctrlp_working_path_mode = 0

" Neomake autolinting stuff
let g:neomake_autolint_sign_column_always =1

let g:neomake_warning_sign = {
  \ 'text': '?',
  \ 'texthl': 'ErrorMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '!',
  \ 'texthl': 'ErrorMsg',
  \ }

" let g:neomake_python_flake8_maker = {
"     \ 'args': ['--format=default'],
"     \ 'errorformat':
"         \ '%E%f:%l: could not compile,%-Z%p^,' .
"         \ '%A%f:%l:%c: %t%n %m,' .
"         \ '%A%f:%l: %t%n %m,' .
"         \ '%-G%.%#',
"     \ }

let g:neomake_python_mypy_args = ['--ignore-missing-imports', '--follow-import=skip']

let g:neomake_python_enabled_makers = ['flake8', 'pylint', 'mypy']

let g:black_linelength = 79
autocmd BufWritePre *.py execute ':Black'

" autocmd! BufReadPost,BufWritePost * Neomake
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set timeoutlen=10 ttimeoutlen=0

" get rid of backspace fuckery
:set backspace=indent,eol,start

set clipboard=unnamed
