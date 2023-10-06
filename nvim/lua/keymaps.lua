local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local my_command = vim.api.nvim_create_user_command

--normal
--バッファの切替
keymap("n", "<C-j>", ":bprev<CR>", opts)
keymap("n", "<C-k>", ":bnext<CR>", opts)

--ESCキー2度押しでハイライトの切り替え
keymap("n", "<Esc><Esc>", ":set nohlsearch!<CR>", opts)

--Tでターミナルを下に開く
my_command('T', 'split|wincmd j|resize 15|set nonumber|terminal', { nargs = 0 })

--VTでターミナルを横に開く
my_command("VT", "vsplit|wincmd l|vertical resize 80|set nonumber|terminal", {nargs = 0})

--netrwの表示
my_command("E", "Lex|vertical resize 30|wincmd p", {nargs = 0})

--terminal
--Escキーでターミナルを抜ける
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
