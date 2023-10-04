"Scripts-----------------------------
set nocompatible

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

    call dein#begin($HOME.'/.cache/dein')

    call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')

    let s:toml_dir = expand('~/.config/nvim/')

endif

call dein#load_toml(s:toml_dir.'dein_no_lazy.toml', {'lazy':0})

call dein#load_toml(s:toml_dir.'dein_lazy.toml', {'lazy':1})

call dein#end()

filetype plugin indent on

syntax enable

runtime keymap.vim

runtime tex_config.vim

"インデントを空白4つ分にする
set ts=4 sw=4 et

set matchtime=15

"Cのインデント
set cindent shiftwidth=4

"status line---------------------------------------------------
set laststatus=0

set encoding=utf-8
scriptencoding utf-8

"link clipboard with neovim
set clipboard+=unnamedplus 

"制御文字を表示
set list

set shellslash

"netrw-----------------------------
"tree形式
let g:netrw_liststyle=3

" ヘッダを非表示にする
let g:netrw_banner=0

" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"

" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

"起動時にnetrwを表示
au VimEnter * F
