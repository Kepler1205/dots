vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

-- ctrl + arrow window navigation
keymap("n", "<C-left>",  "<C-w>h", opts)
keymap("n", "<C-right>", "<C-w>l", opts)
keymap("n", "<C-up>", 	 "<C-w>k", opts)
keymap("n", "<C-down>",  "<C-w>j", opts)

-- splits
keymap("n", "<leader>sh", "<cmd> split <CR>", opts)
keymap("n", "<leader>sv", "<cmd> vsplit <CR>", opts)

-- new buffer/tab
keymap("n", "<leader>b", "<cmd> enew <CR>", opts)
keymap("n", "<leader>e", "<cmd> Ex <CR>", opts)
keymap("n", "<leader>t", "<cmd> tabnew <CR>", opts)

-- delete buffer
keymap("n", "<leader>x", "<cmd> bd <CR>", opts)

-- move through tabs
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- move through buffers
keymap("n", "<CR>", "<cmd> bnext <CR>", opts)
keymap("n", "<S-<CR>>", "<cmd> bprevious <CR>", opts)

-- telescope
keymap("n", "<leader>T", "<cmd> Telescope <CR>", opts)
keymap("n", "<leader>f", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<leader>b", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<leader>m", "<cmd> Telescope man_pages <CR>", opts)
keymap("n", "<leader>h", "<cmd> Telescope help_tags <CR>", opts)
keymap("n", "<leader>j", "<cmd> Telescope jumplist <CR>", opts)

-- LSP
keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
keymap("n", "gD", function() vim.lsp.buf.delcaration() end, opts)
keymap("n", "gr", function() vim.lsp.buf.references() end, opts)
keymap("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
keymap("v", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

-- load all plugins
keymap("n", "<leader>la", "<cmd> Lazy load all <CR>", opts)

-- reload init.lua
keymap("n", "<leader>=", "<cmd> source $MYVIMRC <CR>", opts)

-- move lines
keymap("v", "J", ":m'>+1<CR>gv=gv", opts)
keymap("v", "K", ":m'>-2<CR>gv=gv", opts)

-- cursor placement fixes
keymap("n", "J", "mzJ`z", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- paste into system clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

-- terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
