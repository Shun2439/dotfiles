set nu

set fileencodings=utf-8,cp932
set clipboard^=unnamed,unnamedplus

set expandtab
set smartindent
set autoindent
filetype plugin indent on

set showcmd

set wildmenu

set ignorecase
set incsearch

let g:isVisualStudioProject = 1

let g:normalEdit = 0

if normalEdit
	set shiftwidth=4
	set tabstop=4
endif

if isVisualStudioProject
	set shiftwidth=2
	set tabstop=2
endif

set background=dark
filetype indent plugin on

syntax enable

au BufNewFile,BufRead *.py
			\ set tabstop=4
			\|set softtabstop=4
			\|set shiftwidth=4
			\|set textwidth=79
			\|set expandtab
			\|set autoindent
			\|set fileformat=unix

" autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -T4pb
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -T4pb

" netrw ----- {{{
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1

" 3 - open files in a new tab
let g:netrw_browse_split = 4

let g:netrw_winsize = 20

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" <https://shapeshed.com/vim-netrw/>
" }}}
