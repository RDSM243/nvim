local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- add list of plugins to install
local plugins = {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    "christoomey/vim-tmux-navigator", --split window navigation
    "szw/vim-maximizer", -- maximizes and restore current window
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "numToStr/Comment.nvim",
    "nvim-tree/nvim-tree.lua", -- file explorer
    "nvim-tree/nvim-web-devicons", --vscode icons
    "nvim-lualine/lualine.nvim", --statusline
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
    { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

    --colorschemes
    "Shatur/neovim-ayu",
    "k4yt3x/ayu-vim-darker",
    "Alexis12119/nightly.nvim",
    "folke/tokyonight.nvim",

    -- autocompletion
    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths

    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets

    --managing & installing lsp servers
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    --configuring lsp servers
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    {
    "glepnir/lspsaga.nvim",
      branch = "main",
      dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    }, -- enhanced lsp uis
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim",

   --treesitter 
    {
      "nvim-treesitter/nvim-treesitter",
      build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    },

    --auto closing
    "windwp/nvim-autopairs",
    { "windwp/nvim-ts-autotag", dependencies = {"nvim-treesitter"} },

    --git signs plugin
    "lewis6991/gitsigns.nvim",

    --toggle terminal
    {"akinsho/toggleterm.nvim", version = "*"},

    -- deal with sessions    
    "rmagatti/auto-session",
    {
      "rmagatti/session-lens",
      dependencies = {"nvim-telescope/telescope.nvim"},
    },

    -- init screen
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    },
}
require("lazy").setup(plugins, {})
