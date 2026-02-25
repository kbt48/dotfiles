set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos
set noswapfile
set autoread
set number
set relativenumber
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set laststatus=2
set wildmenu
set list
set listchars=tab:»-,trail:･,nbsp:%,eol:↲,extends:»,precedes:«

nnoremap gf gF

nnoremap <Space>n :<C-u>nohlsearch<CR>

nnoremap x "_x
xnoremap x "_x

inoremap jj <Esc>
inoremap <C-l> <Del>

nnoremap ; :
nnoremap : ;
nnoremap q; q:
xnoremap ; :
xnoremap : ;

filetype plugin indent on
syntax enable
