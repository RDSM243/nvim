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

vim.g.mapleader = " " --Setting leader key

-- add list of plugins to install
local plugins = {
	--colorschemes
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", --split window navigation
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"nvim-tree/nvim-tree.lua", -- file explorer
	"nvim-tree/nvim-web-devicons", --vscode icons

	{
		"telescope.nvim", -- fuzzy finder
		dependencies = {
			-- dependency for better sorting performance
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	-- maximizes and restore current window
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("RDSM.plugins.comment")
		end,
	},

	"nvim-lualine/lualine.nvim", --statusline

	-- autocompletion
	{
		"hrsh7th/nvim-cmp", -- completion plugin
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			--snippets
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
		},
		config = function()
			require("RDSM.plugins.nvim-cmp")
		end,
	},

	--managing & installing lsp, linters, formatters
	"williamboman/mason.nvim",

	--configuring lsp servers
	{
		"VonHeikemen/lsp-zero.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
		config = function()
			require("RDSM.plugins.lsp.mason")
			require("RDSM.plugins.lsp.lspconfig")
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "LspAttach",
		config = function()
			require("RDSM.plugins.lsp.lspsaga")
		end,
	},

	--configuring linters
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("RDSM.plugins.linting")
		end,
	},

	--configuring formatters
	{
		"stevearc/conform.nvim",
		enabled = false, --to enable this plugin set this equal to true
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("RDSM.plugins.formatting")
		end,
	},

	--treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "windwp/nvim-ts-autotag" }, --auto closing
		},
		build = ":TSUpdate",
		config = function()
			require("RDSM.plugins.treesitter")
		end,
	},

	--auto closing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("RDSM.plugins.autopairs")
		end,
	},

	--git signs plugin
	"lewis6991/gitsigns.nvim",

	--toggle terminal
	{ "akinsho/toggleterm.nvim", version = "*" },

	-- deal with sessions
	{
		"rmagatti/session-lens",
		dependencies = {
			{ "rmagatti/auto-session" },
		},
	},

	-- init screen
	"goolord/alpha-nvim",

	--ui improvements
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

  {
    "lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      require("RDSM.plugins.blankline")
    end,
  },
}
require("lazy").setup(plugins, {})
