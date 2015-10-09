" Color Scheme
colorscheme jellybeans
"colorscheme hybrid

" Set tab visible width
set tabstop=4

" Set insert tab width
set shiftwidth=4

" No vi compatible
set nocompatible

" Enable syntax
syntax on

" Enable mouse
set mouse=a
set ttymouse=xterm2

" Show number
set number

" Show status line
set laststatus=2

" Emphasis {}  
set showmatch

" For long line
set display=lastline

" Insert ) and move to it when ( is inputted and set time 0.1*1 to move
set showmatch
set matchtime=1

set backspace=indent,eol,start

" Yank to clipboard
set clipboard+=unnamed

" Not insert comment out automatically 
autocmd FileType * set formatoptions-=ro

" Mapping for GNU Global
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
let Gtags_Auto_Update = 1

"--------- For NeoBundle -----------

" Disable filetype
filetype off

" Set neobundle at first
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	" Path to install plugin
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Set plungins to install
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'kana/vim-smartword'
NeoBundle 'vim-scripts/taglist.vim'

" Color Scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

filetype plugin on
filetype indent on

"------- For NeoBundle end --------

"------- For neocomplcache --------
"Enable neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neobundle_default_git_protocol='https'

"----- For neocomplcache end ------


"------- For lightline --------
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'modified': 'MyModified',
			\   'readonly': 'MyReadonly',
			\   'fugitive': 'MyFugitive',
			\   'filename': 'MyFilename',
			\   'fileformat': 'MyFileformat',
			\   'filetype': 'MyFiletype',
			\   'fileencoding': 'MyFileencoding',
			\   'mode': 'MyMode'
			\ }
			\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO |' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"----- For lightline end ------

"----- For indentline start -------
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
set list listchars=tab:\¦\ 
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
"----- For indentline end -------

autocmd FileType * setlocal formatoptions-=ro

set noswapfile

