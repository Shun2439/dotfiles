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
call dein#add('vim-jp/vimdoc-ja')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('skanehira/jumpcursor.vim')
call dein#add('vim-skk/eskk.vim')
call dein#add('sophacles/vim-processing')

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
set helplang=ja

set clipboard+=unnamedplus "link clipboard with vim

inoremap <C-f> <C-g>U<Right> "インサートモードのままカーソル移動
inoremap <C-f><C-f> <C-g>U<ESC><S-a>
"indent guides------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_enable_guide_size = 1
"search---------------------------------------------------------
nmap [j <Plug>(jumpcursor-jump)
