local o = vim.opt

vim.cmd[[colorscheme tokyonight]]

-- line numbers
o.number = true
o.relativenumber = true

-- tabs
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4

-- bg highlights
-- o.cursorline = true
-- o.screenline = true

-- searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- formatoptions
o.formatoptions = ""

-- misc
o.wrap = false
o.termguicolors = true
o.syntax = "on"
o.mouse = "a"
o.shell = "/usr/bin/fish"
o.hidden = true
o.scrolloff = 8
