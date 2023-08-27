---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
    theme = "gatekeeper",
    transparency = true,
    hl_override = highlights.override,
    hl_add = highlights.add,

    statusline = {
        theme = "minimal",
        separator_style = "block",
    },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- custom options from bare config
local options = {

    -- change default shell in terminal to fish
    shell = "/usr/bin/fish",

    -- enable sytax hightlighting
    syntax = "on",

    -- lets neovim use system clipboard
    clipboard = "unnamedplus",

    -- enable mouse
    mouse = "a",

    -- left side number-lines
    number = true,
    relativenumber = true,

    -- tabs
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,

    --list = true,
    --listchars = { tab = '▶ ', trail = '•', nbsp = '␣' },

    -- don't save when switching buffers
    hidden = true,

    -- highlight search
    hlsearch = true,

    -- ignore case for search unless there's a capital
    ignorecase = true,
    smartcase = true,

    -- background highlighting on the cursor
    cursorline = true,
    cursorlineopt = "screenline",

    -- text completion in command mode
    -- wildmode = "longest,list,full",

    -- scrolls down automatically 
    -- when 8 lines away from top or bottom
    scrolloff = 8,

    -- disable line wrapping
    --wrap = false
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = {"*.tex"},
    command = "!pdflatex *.tex",
})

return M
