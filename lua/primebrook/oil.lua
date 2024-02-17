local M = {}

function M.setup()
	require("oil").setup({
		use_default_keymaps = false,
		keymaps = {
			["<CR>"] = "actions.select",
			["-"] = "actions.parent",
		},
		view_options = {
			show_hidden = false,
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, "..") or name == ".git" or name == ".vscode"
			end,
		},
	})
end

return M
