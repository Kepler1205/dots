
-- lsp-zero
local lsp = require("lsp-zero").preset({})
require("lsp-zero").extend_cmp()

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
	handlers = {
		lsp.default_setup,
	}
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

local lspconfig = require("lspconfig")

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.clangd.setup{}
lspconfig.bashls.setup{}

-- using rust-tools to setup rust
lsp.skip_server_setup({"rust_analyzer"})


-- completion
local cmp = require("cmp")

cmp.setup({
 	snippet = {
 		expand = function(args)
 			require("luasnip").lsp_expand(args.body)
 		end,
 	},
 	window = {
 		completion = cmp.config.window.bordered(),
 		documentation = cmp.config.window.bordered(),
 	},
	mapping = cmp.mapping.preset.insert({
		-- ["<C-Space>"] = cmp.mapping.complete(),
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "luasnip"},
	}, {
		{name = "buffer"},
	})
})

--[[ cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
}) ]]

require("nvim-treesitter.configs").setup {
	ensure_installed = {"c", "cpp", "rust", "bash", "fish", "python"},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},

	highlight = {
		enable = true,
	}
}

lsp.setup()
