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

"対応する括弧を表示する
set showmatch

"showmatchの時間
set matchtime=1

"Cのインデント
set cindent

"status line
set laststatus=2

"vimで使う文字コードの宣言
set encoding = "utf-8"

"スクリプトで使われる文字コードの宣言
scriptencoding = "utf-8"

"link clipboard with neovim
set clipboard+=unnamedplus

" WSL clipboard
if !empty($WSL_DISTRO_NAME)
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            au!
            au TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif

"制御文字を表示
set list

set number

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

"ターミナルをインサートモードで開く
au TermOpen * startinsert 
