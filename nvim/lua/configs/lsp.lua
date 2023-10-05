local lsp = require("lsp-zero").preset({})
require("lsp-zero").extend_cmp()

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

cmp.setup.cmdline('/', {
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
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").clangd.setup{}
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").bashls.setup{}

-- mason
require("mason").setup()

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
