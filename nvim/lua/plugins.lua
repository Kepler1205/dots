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

local plugins = {
	--
	-- plugin list
	--

	------ IDE stuff ------
	-- misc
	{
		"nvim-telescope/telescope.nvim",
		branch = '0.1.x',
		dependencies = {"nvim-lua/plenary.nvim"},
	},
	"nvim-telescope/telescope-file-browser.nvim",
	-- LSP stuff
	"folke/neodev.nvim",
	{
	  "VonHeikemen/lsp-zero.nvim",
	  lazy = false,
	  branch = "v2.x",
	  dependencies = {
	    -- LSP Support
	    {"neovim/nvim-lspconfig"},             -- Required
	    {"williamboman/mason.nvim"},           -- Optional
	    {"williamboman/mason-lspconfig.nvim"}, -- Optional

	    -- Autocompletion
	    {"hrsh7th/nvim-cmp"},     -- Required
	    {"hrsh7th/cmp-nvim-lsp"}, -- Required
	    {"L3MON4D3/LuaSnip"},     -- Required
	  }
	},
	-- autocompletion
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	-- syntax highlighting
	"nvim-treesitter/nvim-treesitter",
	-- debug
	--"mfussenegger/nvim-dap",
	--"rcarriga/nvim-dap-ui",
	-- lang specific
	"simrat39/rust-tools.nvim",
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	},

	------ UI stuff ------
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},
	"lukas-reineke/indent-blankline.nvim",
	"ThePrimeagen/vim-be-good",
	"NStefan002/speedtyper.nvim",
};

local options = {};

require("lazy").setup(plugins, options)

-- load plugin configs
require "configs.telescope"
require "configs.lsp"
--require "configs.dap"
require "configs.autopairs"
require "configs.langs"
require "configs.comment"
require "configs.speedtyper"
require "configs.indent-blankline"
require "configs.snippets"
