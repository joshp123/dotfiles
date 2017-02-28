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

" pathogen!
execute pathogen#infect()

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

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-n> :bnext<CR>
:map <F5> :%! python -mjson.tool<CR>

let g:ctrlp_custom_ignore = {'dir': '\v[\/](\.(git|hg|svn|dist)|node_modules|bower_components|WEB-INF|build|dist)$' }
let g:ctrlp_working_path_mode = 0
