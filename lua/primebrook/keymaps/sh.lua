local M = {}

function M.setup()
	-- formatting
	local current_filepath = vim.fn.expand("%:p")
	vim.keymap.set(
		"n",
		"<leader>ff",
		":!shfmt -i 2 -w " .. current_filepath .. "<CR>",
		{ noremap = true, silent = true }
	)
end

return M
