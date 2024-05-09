function join_paths(...)
  local path_sep = on_windows and "\\" or "/"
  local result = table.concat({ ... }, path_sep)
  return result
end

local data_path = vim.fn.stdpath("data")

local lazypath = data_path .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

local dictionary_source_path = join_paths(data_path, "SKK-JISYO.L")
local my_dictionary_path = join_paths(data_path, "SKK-JISYO.MY")

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
    "vim-skk/skkeleton",
    dependencies = {"vim-denops/denops.vim"},
    lazy = false,
    config = function()
        vim.fn['skkeleton#config']({
            globalDictionaries = { dictionary_source_path },
            userDictionary = my_dictionary_path,
        })
        vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("t", "<C-j>", "<Plug>(skkeleton-toggle)")
    end
}, {
    "delphinus/skkeleton_indicator.nvim",
    config = function()
        vim.keymap.set("n", "[j", "<Plug>(jumpcursor-jump)")
    end
}, {
    "skanehira/jumpcursor.vim",
    config = function()
        require('skkeleton_indicator').setup {}
    end
}, {
    "EdenEast/nightfox.nvim",
    config = function()
        vim.cmd("colorscheme terafox")
    end
}})

