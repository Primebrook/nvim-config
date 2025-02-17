local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":!black . && isort .<CR>", { noremap = true, silent = true })

	-- Add binding
	vim.keymap.set(
		"n",
		"<leader>x",
		"oimport ipdb ; ipdb.set_trace()<Esc>",
		{ noremap = true, silent = true, buffer = true }
	)
	vim.keymap.set(
		"n",
		"<leader>X",
		"0import ipdb ; ipdb.set_trace()<Esc>",
		{ noremap = true, silent = true, buffer = true }
	)

	-- Commenting
	function toggle_comment()
		-- Get the range of selected lines in visual mode
		local start_line, end_line =
			unpack(vim.api.nvim_buf_get_mark(0, "<")), unpack(vim.api.nvim_buf_get_mark(0, ">"))

		-- Process each line in the range
		for line_num = start_line, end_line do
			local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
			if line:match("^%s*#") then
				-- Uncomment the line
				line = line:gsub("^%s*#", "")
			else
				-- Comment the line
				line = "#" .. line
			end
			vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { line })
		end
	end
	vim.api.nvim_set_keymap("n", "<leader>c", ":lua toggle_comment()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("x", "<leader>c", ":'<,'>lua toggle_comment()<CR>", { noremap = true, silent = true })
end

return M
