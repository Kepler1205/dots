local highlight = {
	"IndentBL",
	"Whitespace"
}

vim.cmd("hi IndentBL guibg=#080808")

require("ibl").setup {
	indent = { highlight = highlight, char = "" },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false }
}
