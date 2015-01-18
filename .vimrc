"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has("vim_starting")
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand("~/.vim/bundle/neobundle.vim/README.md")

if !filereadable(neobundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand("~/.vim/bundle/"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch "Shougo/neobundle.vim"
"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle "tpope/vim-fugitive"
NeoBundle "itchyny/lightline.vim"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "vim-scripts/CSApprox"
NeoBundle "scrooloose/syntastic"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/vimproc.vim", {
			\ "build" : {
			\     "windows" : "tools\\update-dll-mingw",
			\     "cygwin" : "make -f make_cygwin.mak",
			\     "mac" : "make -f make_mac.mak",
			\     "unix" : "make -f make_unix.mak",
			\    },
			\ }
NeoBundle "Shougo/vimshell.vim"

"" Color
NeoBundle "tomasr/molokai"

"" Snippets
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"

"" Perl Bundle
NeoBundle "vim-perl/vim-perl"
NeoBundle "c9s/perlomni.vim"

"" PHP Bundle
NeoBundle "arnaud-lb/vim-php-namespace"

"" Python Bundle
NeoBundle "davidhalter/jedi-vim"
NeoBundle "Yggdroot/indentLine"

"" Go Lang Bundle
NeoBundle "fatih/vim-go"

"" HTML Bundle
NeoBundle "mattn/emmet-vim"
NeoBundle "hail2u/vim-css3-syntax"

"" Javascript Bundle


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set autoindent

"" Map leader to ,
let mapleader=","

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme molokai

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrti
set gfn=Monospace\ 8

if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	let g:CSApprox_loaded = 1

	if $COLORTERM == "gnome-terminal"
		set term=gnome-256color
	else
		if $TERM == "xterm"
			set term=xterm-256color
		endif
	endif
endif

if &term =~ "256color"
	set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

let g:lightline = {
			\ "colorscheme": "wombat",
			\ "mode_map": {"c": "NORMAL"},
			\ "active": {
			\   "left": [ [ "mode", "paste" ], [ "fugitive", "filename" ] ]
			\ },
			\ "component_function": {
			\   "modified": "MyModified",
			\   "readonly": "MyReadonly",
			\   "fugitive": "MyFugitive",
			\   "filename": "MyFilename",
			\   "fileformat": "MyFileformat",
			\   "filetype": "MyFiletype",
			\   "fileencoding": "MyFileencoding",
			\   "mode": "MyMode"
			\ }
			\ }

function! MyModified()
	return &ft =~ "help\|vimfiler\|gundo" ? "" : &modified ? "+" : &modifiable ? "" : "-"
endfunction

function! MyReadonly()
	return &ft !~? "help\|vimfiler\|gundo" && &readonly ? "x" : ""
endfunction

function! MyFilename()
	return ("" != MyReadonly() ? MyReadonly() . " " : "") .
	\ (&ft == "vimfiler" ? vimfiler#get_status_string() :
	\  &ft == "unite" ? unite#get_status_string() :
	\  &ft == "vimshell" ? vimshell#get_status_string() :
	\ "" != expand("%:t") ? expand("%:t") : "[No Name]") .
	\ ("" != MyModified() ? " " . MyModified() : "")
endfunction

function! MyFugitive()
	try
		if &ft !~? "vimfiler\|gundo" && exists("*fugitive#head")
			return fugitive#head()
		endif
	catch
	endtry
	return ""
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat : ""
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : "no ft") : ""
endfunction

function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ""
endfunction

function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ""
endfunction

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  "$ "
nnoremap <silent> <leader>sh :VimShellCreate<CR>

"" neocomplete configuration
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#buffer#disabled_pattern = '\.log'
let g:neocomplete#lock_buffer_name_pattern = '\.log'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default'    : '',
			\ 'perl'       : $HOME . '/.vim/dict/perl.dict',
			\ 'php'        : $HOME . '/.vim/dict/php.dict',
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

"" neosnippet configuration
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists("*s:setupWrapping")
	function s:setupWrapping()
		set wrap
		set wm=2
		set textwidth=79
	endfunction
endif

if !exists("*TrimWhiteSpace")
	function TrimWhiteSpace()
		let @*=line(".")
		%s/\s*$//e
		""
	endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

"" make/cmake
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

if has("gui_running")
	autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m "<C-R>="""<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gll :!git pull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl']
"
"" Copy/Paste/Cut
if has("unnamedplus")
	set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

if has("macunix")
	" pbcopy for OSX copy/paste
	vmap <C-x> :!pbcopy<CR>
	vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line(".")<CR> \| xargs open<CR><CR>

"" Custom configs
" Set Keybind the esc key
imap <C-j> <esc>

" vim-python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
			\ formatoptions+=croq softtabstop=4 smartindent
			\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

" syntastic
let g:syntastic_python_checkers=["python", "flake8"]

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_settings = {
	\ 'lang' : 'ja',
	\ 'html' : {
	\ 'indentation': ' ',
	\ 'filters' : 'html',
	\ },
	\ 'css' : {
	\ 'filters' : 'fc',
	\ },
	\ 'php' : {
	\ 'extends' : 'html',
	\ 'filters' : 'html',
	\ },
\ }

"" Include user"s local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
