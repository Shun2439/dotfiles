set nu

set fileencodings=utf-8,cp932

"set expandtab
"set smartindent

let g:isVisualStudioProject = 0

let g:normalEdit = 1

if normalEdit
	set shiftwidth=2
	set tabstop=2
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
