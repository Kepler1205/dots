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
	-- LSP stuff
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- syntax highlighting
	"nvim-treesitter/nvim-treesitter",
	-- debug
	{"mfussenegger/nvim-dap", lazy = true};
	{"rcarriga/nvim-dap-ui", lazy = true};

	------ UI stuff ------
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
		}
	};
	{"nvim-lualine/lualine.nvim", enabled = false};
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	};
};

local options = {};

require("lazy").setup(plugins, options)

-- load plugin configs
require "configs.mason"
require "configs.treesitter"
-- require "configs.lualine"
