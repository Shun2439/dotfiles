set nu

set fileencodings=utf-8,cp932
set clipboard=unnamedplus

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
			\ set softtabstop=4
			\ set shiftwidth=4
			\ set textwidth=79
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

" autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -T4pb
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -T4pb

