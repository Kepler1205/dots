local lsp = require("lsp-zero").preset({
	name = "recommended",
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

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
