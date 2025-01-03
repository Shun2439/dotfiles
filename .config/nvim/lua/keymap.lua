local opts = {
    noremap = true,
    silent = true
}
local term_opts = {
    silent = true
}
local keymap = vim.api.nvim_set_keymap

-----------------
-- normal mode --
-----------------

-- バッファの切替
keymap("n", "<C-j>", ":bprev<CR>", opts)
keymap("n", "<C-k>", ":bnext<CR>", opts)

-- ESCキー2度押しでハイライトの切り替え
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", opts)

-------------------
-- terminal mode --
-------------------

-- escape insert mode 
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts);

