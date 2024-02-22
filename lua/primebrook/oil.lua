local M = {}

function M.setup()
	local function hidden_files(name, _bufnr)
		local hidden_name = {
			[".."] = true,
			[".git"] = true,
			[".vscode"] = true,
		}
		return hidden_name[name] or false
	end

	require("oil").setup({
		use_default_keymaps = false,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["<CR>"] = "actions.select",
			["-"] = "actions.parent",
		},
		view_options = {
			show_hidden = false,
			is_hidden_file = hidden_files,
		},
	})
end

return M
