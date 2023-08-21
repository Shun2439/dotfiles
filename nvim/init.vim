"Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

if has("win64")

    set runtimepath+=\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim

    call dein#begin('\Users\shunt\.cache\dein')

    call dein#add('\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim')

    let s:toml_dir = expand('\Users\shunt\AppData\Local\nvim\')

else
"linux

    let $CACHE = expand('~/.cache')

    if !isdirectory($CACHE)
        call mkdir($CACHE, 'p')
    endif

    if &runtimepath !~# '/dein.vim'
        let s:dein_dir = fnamemodify('dein.vim', ':p')

        if !isdirectory(s:dein_dir)
            let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'

            if !isdirectory(s:dein_dir)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir

            endif

        endif

        execute 'set runtimepath^=' .. substitute(
                    \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
    endif

    set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    let s:toml_dir = expand('~/.config/nvim/')

endif

call dein#load_toml(s:toml_dir.'dein_no_lazy.toml', {'lazy':0})

call dein#load_toml(s:toml_dir.'dein_lazy.toml', {'lazy':1})

let g:dein#auto_recache = 1

call dein#end()

filetype plugin indent on

syntax enable

source ./keymap.vim

source ./tex_config.vim

"if dein#check_install()
"  call dein#install()
"endif

set matchtime=15

"status line---------------------------------------------------
set laststatus=0

set encoding=utf-8
scriptencoding utf-8

set clipboard+=unnamedplus "link clipboard with neovim

" 設定ファイルの自動再読み込みを有効にする
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"制御文字を表示
set list
