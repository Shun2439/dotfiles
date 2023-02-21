"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=C:\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim

" Required:
call dein#begin('C:\Users\shunt\.cache\dein')

" Let dein manage dein
" Required:
call dein#add('C:\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('vim-jp/vimdoc-ja') "helpを日本語化
"call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('skanehira/jumpcursor.vim') "カーソル移動が楽になるプラグイン
call dein#add('vim-skk/eskk.vim') "日本語用プラグイン？
call dein#add('sophacles/vim-processing')
call dein#add('Yggdroot/indentLine') "インデント可視化
call dein#add('dense-analysis/ale')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-surround')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
"call dein#add('morhetz/gruvbox') "theme

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"appearance----------------------------------------------------------------------------
set background=dark
set number
"behavior------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8

set ambiwidth=double " □や○文字が崩れる問題を解決
set helplang=ja

set clipboard+=unnamedplus "link clipboard with vim

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> 
" ESCキー2度押しでハイライトの切り替え
inoremap <C-f> <C-g>U<Right> 
"インサートモードのままカーソル移動
inoremap <C-f><C-f> <C-g>U<ESC><S-a>

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk 
" 行末の空白を可視化する
"set list listchars=tab:»·,trail:·
" 設定ファイルの自動再読み込みを有効にする
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"indent guides------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_enable_guide_size = 1
"search---------------------------------------------------------
nmap [j <Plug>(jumpcursor-jump)
"status line---------------------------------------------------
set laststatus=2
set statusline=%#title#%t%=%y%<

"ale-------------------------------------------------------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
"vimtex-----------------------------------
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
			\ 'executable': 'latexmk',
			\ 'options': [
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\   '-pdf',
			\ ],
			\ }
"airline------------------------
" テーマの設定
"let g:airline_theme='gruvbox'

" セパレーターの設定
let g:airline_left_sep = ''
let g:airline_right_sep = ''
