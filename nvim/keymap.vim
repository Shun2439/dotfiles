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

