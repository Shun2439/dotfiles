set nu

set background=dark
filetype indent plugin on

syntax on

if &filetype == 'toml'
	call dein#toml#syntax()
endif
