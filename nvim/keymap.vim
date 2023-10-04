"Escキーでターミナルを抜ける
tnoremap <Esc> <C-\><C-n> 

"ターミナルをインサートモードで開く
au TermOpen * startinsert 

command! -nargs=* T split|wincmd j|resize 15|set nonumber|terminal <args>
command! -nargs=* VT vsplit|wincmd l|vertical resize 80|set nonumber|terminal <args>
"nnoremap T :vsplit | wincmd j | resize 15 | terminal <CR>
command! -nargs=* V vsplit <args>
command! -nargs=* H resize 0|wincmd p <args>
command! -nargs=* O resize 15 <args>
command! -nargs=* VH vertical resize 0|wincmd p <args>
command! -nargs=* VO vertical resize 80 <args>
command! -nargs=* B %!xxd <args>

"netrwの表示
command! -nargs=* F Lex|vertical resize 30|wincmd p <args>

"バッファの切替
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

