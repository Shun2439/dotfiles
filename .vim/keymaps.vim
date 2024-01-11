"normal
"バッファの切替
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

inoremap {<CR> {<CR>}<C-o>O

"netrwの表示
command! -nargs=* F Lex|vertical resize 20|wincmd p <args>

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>
