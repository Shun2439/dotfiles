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

require("lazy").setup({
  {
    "neoclide/coc.nvim",
    branch = 'release',
  },

  {
    'akinsho/flutter-tools.nvim',
    ft = "dart",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true
  },

  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim"
    },
    lazy = false,
    keys = {
      { "<C-j>", "<Plug>(skkeleton-toggle)", mode = "i" },
      { "<C-j>", "<Plug>(skkeleton-toggle)", mode = "c" },
      { "<C-j>", "<Plug>(skkeleton-toggle)", mode = "t" },
    },
    config = function()
      vim.fn['skkeleton#config']({
        globalDictionaries = { dictionary_source_path },
        userDictionary = my_dictionary_path,
      })
    end
  },

  {
    "delphinus/skkeleton_indicator.nvim",
    lazy = false,
    opts = {}
  },

  {
    "skanehira/jumpcursor.vim",
    lazy = false,
    keys = {
      { "[j", "<Plug>(jumpcursor-jump)" },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    enabled = false,
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end
  },

  {
    "mattn/vim-maketable",
    lazy = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      auto_install = true, -- with `npm install -g tree-sitter-cli`
      highlight = {
        enable = true,
      },
    },
  },

  {
    "vim-airline/vim-airline",
    lazy = false,
    enabled = false,
    config = function()
      vim.g['airline#extensions#tabline#enabled']=1
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = { theme = 'auto' },
    },
  },

  {
    "nordtheme/vim",
    config = function()
      vim.cmd([[colorscheme nord]])

      vim.cmd([[hi CocInlayHint ctermbg=8]])
      vim.cmd([[hi CocInlayHint guifg=8]])
      vim.cmd([[hi Visual ctermbg=Gray]])
      vim.cmd([[hi Visual guifg=Gray]])
      vim.cmd([[hi Comment ctermfg=LightBlue]])
      vim.cmd([[hi Comment guifg=LightBlue]])
      vim.cmd([[hi LineNr ctermfg=LightBlue]])
      vim.cmd([[hi LineNr guifg=LightBlue]])
    end
  },

  -- {
  --   -- <https://github.com/nvim-java/starter-lazyvim/blob/main/lua/plugins/java/init.lua>
  --   "nvim-java/nvim-java",
  --   config = false,
  --   dependencies = {
  --     {
  --       "neovim/nvim-lspconfig",
  --       opts = {
  --         servers = {
  --           jdtls = {
  --             -- your jdtls configuration goes here
  --           },
  --         },
  --         setup = {
  --           jdtls = function()
  --             require("java").setup({
  --               -- your nvim-java configuration goes here
  --             })
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
})

