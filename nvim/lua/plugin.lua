local opts = {
    noremap = true,
    silent = true
}
local term_opts = {
    silent = true
}
local keymap = vim.api.nvim_set_keymap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    "neoclide/coc.nvim",
    branch = 'release'
}, {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' -- optional for vim.ui.select
    },
    config = true
}, {
    "vim-denops/denops.vim",
    lazy = false
}, {
    "vim-skk/skkeleton",
    lazy = false
}})

---------------
-- skkeleton --
---------------
vim.fn['skkeleton#config']({
    globalDictionaries = "~/.config/SKK-JISYO.L"
})
keymap("i", "<C-j>", "<Plug>(skkeleton-toggle)", opts)
keymap("c", "<C-j>", "<Plug>(skkeleton-toggle)", opts)
keymap("t", "<C-j>", "<Plug>(skkeleton-toggle)", opts)

