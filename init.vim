"Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

if has("win64")

    " Required:
    set runtimepath+=C:\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim

    " Required:
    call dein#begin('C:\Users\shunt\.cache\dein')

    " Let dein manage dein
    " Required:
    call dein#add('C:\Users\shunt\.cache\dein\repos\github.com\Shougo\dein.vim')

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
call dein#add('skanehira/jumpcursor.vim') "カーソル移動が楽になるプラグイン
call dein#add('vim-skk/eskk.vim') "日本語用プラグイン？
"call dein#add('Yggdroot/indentLine') "インデント可視化
"call dein#add('dense-analysis/ale')
"call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-surround')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('ctrlpvim/ctrlp.vim')

"call dein#add('vim-airline/vim-airline')
"call dein#add('vim-airline/vim-airline-themes')
"call dein#add('powerline/powerline-fonts')

call dein#add('preservim/nerdtree')

call dein#add('shaunsingh/nord.nvim')
call dein#add('ryanoasis/vim-devicons')
" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
let g:dein#auto_recache = 1

"appearance----------------------------------------------------------------------------
set background=dark
"set number
colorscheme nord 
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
"key---------------------------------
"nnoremap {gg=G} {g=}
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert
command! -nargs=* T split|wincmd j|resize 15|set nonumber|terminal <args>
command! -nargs=* VT vsplit|wincmd l|vertical resize 80|set nonumber|terminal <args>
"nnoremap T :vsplit | wincmd j | resize 15 | terminal <CR>
command! -nargs=* V vsplit <args>
command! -nargs=* TB tabnew <args>
command! -nargs=* S split <args>
command! -nargs=* E NERDTree <args>
command! -nargs=* H resize 0|wincmd p <args>
command! -nargs=* F resize 15 <args>
command! -nargs=* VH vertical resize 0|wincmd p <args>
command! -nargs=* VF vertical resize 80 <args>
"NERDTree-----------------------------
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden=1
"let g:NERDTreeDirArrowExpandable = '?'
"let g:NERDTreeDirArrowCollapsible = '?'
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd VimEnter * NERDTree | wincmd p
"devicons------------------------------------------------------------------
set guifont=Hack:h14
"Coc--------------------------
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"highlight---------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')
"ltex---------------------
let g:coc_filetype_map = {'tex': 'latex'}
"behavior------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8

set guifont=Hack

set helplang=ja

set clipboard+=unnamedplus "link clipboard with vim

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" 設定ファイルの自動再読み込みを有効にする
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"空白表示
set list
"tex----------------------------------------
let g:tex_conceal = ""

autocmd BufWritePost *.tex silent! call Tex()
function! Tex()
    let fname = expand('%:p:r')
    exec "w"
    exec "!platex ".fname.".tex"
    exec "!dvipdfmx ".fname.".dvi"
endfunction
"----------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
