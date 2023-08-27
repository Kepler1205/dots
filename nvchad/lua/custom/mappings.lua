---@type MappingsTable
local M = {}

-- M.general = {
--   n = {
--     [";"] = { ":", "enter command mode", opts = { nowait = true } },
--   },
-- }

-- more keybinds!

local opts = { noremap = true, silent = true }

-- local keymap = vim.api.nvim_set_keymap

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal mode:

vim.keymap.set("n", "J", "ddp")
vim.keymap.set("n", "K", "ddkP")

-- move between split bindings
vim.keymap.set("n", "<C-left>",  "<C-w>h", opts)
vim.keymap.set("n", "<C-right>", "<C-w>l", opts)
vim.keymap.set("n", "<C-up>",    "<C-w>k", opts)
vim.keymap.set("n", "<C-down>",  "<C-w>j", opts)

vim.keymap.set("n", "<C-d", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u", "<C-u>zz", opts)

-- insert mode:

-- visual mode:
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)


return M
