"
"command
"
"Tでターミナルを下に開く
command! -nargs=* T split|wincmd j|resize 15|set nonumber|terminal <args>

"VTでターミナルを横に開く
command! -nargs=* VT vsplit|wincmd l|vertical resize 80|set nonumber|terminal <args>

"netrwの表示
command! -nargs=* F Lex|vertical resize 20|wincmd p <args>
"
"
"

"
"normal
"
"バッファの切替
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>
"
"
"

"
"terminal
"
"Escキーでターミナルを抜ける
tnoremap <Esc> <C-\><C-n>
"
"
"
