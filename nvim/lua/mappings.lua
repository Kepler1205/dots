vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

-- enforce hjkl
--[[ keymap("n", "<Left>", "", opts)
keymap("n", "<Right>", "", opts)
keymap("n", "<Up>", "", opts)
keymap("n", "<Down>", "", opts)

keymap("i", "<Left>", "", opts)
keymap("i", "<Right>", "", opts)
keymap("i", "<Up>", "", opts)
keymap("i", "<Down>", "", opts)

keymap("v", "<Left>", "", opts)
keymap("v", "<Right>", "", opts)
keymap("v", "<Up>", "", opts)
keymap("v", "<Down>", "", opts) ]]

-- ctrl + arrow window navigation
keymap("n", "<C-left>",  "<C-w>h", opts)
keymap("n", "<C-right>", "<C-w>l", opts)
keymap("n", "<C-up>", 	 "<C-w>k", opts)
keymap("n", "<C-down>",  "<C-w>j", opts)

-- disable <S-up/down> to pageup/down in all modes
keymap("n", "<S-up>",   "", opts)
keymap("n", "<S-down>", "", opts)
keymap("i", "<S-up>",   "", opts)
keymap("i", "<S-down>", "", opts)
keymap("v", "<S-up>",   "", opts)
keymap("v", "<S-down>", "", opts)

-- reselect pasted text
keymap("n", "<leader>v", "`[v`]", opts)

-- delete paren/bracket/brace pair
keymap("n", "dA(",  "di(va(p",   opts)
keymap("n", "dA{",  "di{va{p",   opts)
keymap("n", "dA[",  "di[va[p",   opts)
keymap("n", "dA<",  "di<va<p",   opts)
keymap("n", "dA\"", "di\"va\"p", opts)
keymap("n", "dA'",  "di'va'p",   opts)

-- splits
keymap("n", "<leader>sh", "<cmd> split <CR>", opts)
keymap("n", "<leader>sv", "<cmd> vsplit <CR>", opts)

-- new buffer/tab
keymap("n", "<leader>b", "<cmd> enew <CR>", opts)
keymap("n", "<leader>t", "<cmd> tabnew <CR>", opts)

-- delete buffer
keymap("n", "<leader>x", "<cmd> bd <CR>", opts)

-- move through tabs
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- move through buffers
keymap("n", "<CR>", "<cmd> bnext <CR>", opts)
keymap("n", "<S-<CR>>", "<cmd> bprevious <CR>", opts)

-- load all plugins
keymap("n", "<leader>la", "<cmd> Lazy load all <CR>", opts)

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

------------ plugins ------------ 
-- comment
keymap("n", "<leader>/", "<cmd> norm gcc <CR>", opts)
keymap("v", "<leader>/", "<cmd> norm gb <CR>", opts)

-- telescope
keymap("n", "<leader>T", "<cmd> Telescope <CR>", opts)
keymap("n", "<leader>f", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<leader>q", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<leader>b", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<leader>m", "<cmd> Telescope man_pages <CR>", opts)
keymap("n", "<leader>h", "<cmd> Telescope help_tags <CR>", opts)
keymap("n", "<leader>j", "<cmd> Telescope jumplist <CR>", opts)
keymap("n", "<leader>e", "<cmd> Telescope file_browser <CR>", opts)
keymap("n", "<leader>g", "<cmd> Telescope git_files <CR>", opts)

keymap("n", "gd", "<cmd> Telescope lsp_definitions <CR>", opts)
keymap("n", "gD", "<cmd> Telescope lsp_references <CR>", opts)

-- LSP
-- keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- keymap("n", "gD", function() vim.lsp.buf.delcaration() end, opts)
keymap("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
keymap("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
keymap("v", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
-- keymap("i", "<S-<CR>>", function() require("cmp").mapping.confirm({select = true}) end, opts)

-- Luasnip
keymap("i", "<C-Tab>", function() require("luasnip").jump(1) end, opts)
keymap("i", "<C-S-Tab>", function() require("luasnip").jump(-1) end, opts)

-- DAP
-- keymap("n", "<F5>", function() require("dap").continue() end, opts)
-- keymap("n", "<F10>", function() require("dap").step_over() end, opts)
-- keymap("n", "<F11>", function() require("dap").step_into() end, opts)
-- keymap("n", "<F12>", function() require("dap").step_out() end, opts)
-- keymap("n", "<leader>dt", function() require("dapui").toggle() end, opts)
-- keymap("n", "<leader>db", function() require("dap").toggle_breakpoint() end, opts)
-- keymap("n", "<leader>dc", function() require("dap").clear_breakpoints() end, opts)
-- keymap("n", "<leader>dx", function() require("dap").terminate() end, opts)
