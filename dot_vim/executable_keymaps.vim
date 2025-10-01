" normal
" バッファの切替
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

" https://zenn.dev/vim_jp/articles/67ec77641af3f2
nmap zz zz<sid>(z1)
nnoremap <script> <sid>(z1)z zt<sid>(z2)
nnoremap <script> <sid>(z2)z zb<sid>(z3)
nnoremap <script> <sid>(z3)z zz<sid>(z1)

