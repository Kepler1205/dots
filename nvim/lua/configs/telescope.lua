local select_one_or_multi = function(prompt_bufnr)
	local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require('telescope.actions').close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require('telescope.actions').select_default(prompt_bufnr)
	end
end

require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<CR>"] = select_one_or_multi
			}
		},
		-- layout_strategy = "bottom_pane",
		-- layout_config = {
		-- 	height = 0.4,
		-- },
		-- sorting_strategy = "ascending",
		border = true,
		borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
		path_display = {"truncate"}
	},
	pickers = {
		find_files = {hidden = true},
		man_pages = {sections = {"ALL"}}
	},
	extensions = {
		file_browser = {hijack_netrw = true}
	}
}

require("telescope").load_extension "file_browser"
