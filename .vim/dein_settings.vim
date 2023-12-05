"
"install dein
"
let $CACHE = expand('~/.cache')

".cacheがなかったら作成する
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif
"
"
"

"
"road plugins
"
call dein#begin("~/.cache/dein/")

call dein#add(s:dir)

call dein#load_toml('~/.vim/toml/dein.toml', {'lazy' : 0})

call dein#load_toml('~/.vim/toml/dein_lazy.toml', {'lazy' : 1})

call dein#end()

if dein#check_install()
	call dein#install()
endif
"
"
"
