"Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

if has("win64")

    " Required:
    set runtimepath+=\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim

    " Required:
    call dein#begin('\Users\shunt\.cache\dein')

    " Let dein manage dein
    " Required:
    call dein#add('\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim')

else

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

    call dein#begin('$HOME/.cache/dein')

    call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

endif

" Add or remove your plugins here like this:
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' }) "補完
call dein#add('vim-jp/vimdoc-ja') "helpを日本語化
call dein#add('nathanaelkane/vim-indent-guides')
"call dein#add('skanehira/jumpcursor.vim') "カーソル移動が楽になるプラグイン
"call dein#add('vim-skk/eskk.vim') "日本語用プラグイン？
"call dein#add('Yggdroot/indentLine') "インデント可視化
"call dein#add('dense-analysis/ale')
"call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-surround')
call dein#add('bfrg/vim-cpp-modern')
"call dein#add('SirVer/ultisnips')
"call dein#add('honza/vim-snippets')
"call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('powerline/powerline-fonts')

"call dein#add('preservim/nerdtree')

"call dein#add('shaunsingh/nord.nvim')
call dein#add('turbio/bracey.vim')

"theme
call dein#add('connorholyday/vim-snazzy')

"call dein#add('ryanoasis/vim-devicons')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:dein#auto_recache = 1

"appearance----------------------------------------------------------------------------
set background=dark
colorscheme snazzy

"indent guides------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_enable_guide_size = 1

"move---------------------------------------------------------
nmap [j <Plug>(jumpcursor-jump)

"status line---------------------------------------------------
set laststatus=0

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

"airline-------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='transparent'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
           \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_update_conceal_delay = 1000
let g:airline#extensions#tabline#formatter = 'default'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''

let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

"NERDTree-----------------------------
"let g:NERDTreeWinSize = 25
"let NERDTreeShowHidden=1
"let g:NERDTreeDirArrowExpandable = '?'
"let g:NERDTreeDirArrowCollapsible = '?'
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd VimEnter * NERDTree | wincmd p

"tex---------------------
let g:coc_filetype_map = {'tex': 'latex'}

"key---------------------------------
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert

command! -nargs=* T split|wincmd j|resize 15|set nonumber|terminal <args>
command! -nargs=* VT vsplit|wincmd l|vertical resize 80|set nonumber|terminal <args>
"nnoremap T :vsplit | wincmd j | resize 15 | terminal <CR>
command! -nargs=* V vsplit <args>
command! -nargs=* H resize 0|wincmd p <args>
command! -nargs=* O resize 15 <args>
command! -nargs=* VH vertical resize 0|wincmd p <args>
command! -nargs=* VO vertical resize 80 <args>
command! -nargs=* B %!xxd <args>

"バッファの切替
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set encoding=utf-8
scriptencoding utf-8

set helplang=ja

set clipboard+=unnamedplus "link clipboard with neovim

" 設定ファイルの自動再読み込みを有効にする
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"制御文字を表示
set list

"TeXで表示が修正されるのをなくす
let g:tex_conceal = ""

"auto compile tex----------------------------------------

"autocmd BufWritePost *.tex silent! call Tex()
function! Tex()
    let fname = expand('%:p:r')
    exec "w"
    exec "!platex ".fname.".tex"
    exec "!dvipdfmx ".fname.".dvi"
endfunction
"----------------------------------------------
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

"----------------------------------------------------
let g:cpp_simple_highlight = 1
