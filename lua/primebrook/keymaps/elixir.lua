local M = {}

function M.setup()
	-- Prefix w/ pipeline: current line
	vim.keymap.set("n", "<leader>pp", "I|> <Esc>", { noremap = true, silent = true, buffer = true })
	-- Prefix w/ pipeline: visual selection
	vim.keymap.set("v", "<leader>pp", ":'<,'>norm I|> <Esc>", { noremap = true, silent = true, buffer = true })

	-- Remove pipeline prefix: current line
	vim.keymap.set("n", "<leader>rp", ":%s/^|> //g<CR>", { noremap = true, silent = true, buffer = true })
	-- Remove pipeline prefix: visual selection
	vim.keymap.set("v", "<leader>rp", ":s/^|> //g<CR>", { noremap = true, silent = true, buffer = true })

	-- Mix format
	vim.keymap.set("n", "<leader>ff", ":!mix format<CR>", { noremap = true, silent = true, buffer = true })

	-- Add binding
	vim.keymap.set("n", "<leader>x", "orequire IEx ; IEx.pry<Esc>", { noremap = true, silent = true, buffer = true })
	vim.keymap.set("n", "<leader>X", "Orequire IEx ; IEx.pry<Esc>", { noremap = true, silent = true, buffer = true })

	-- Inline function
	vim.keymap.set("n", "<leader>l", "^f)a,<Esc>$a:<Esc>Jjdd", { noremap = true, silent = true, buffer = true })

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

	-- Map the function to a key in normal and visual mode
	vim.api.nvim_set_keymap("n", "<leader>c", ":lua toggle_comment()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("x", "<leader>c", ":'<,'>lua toggle_comment()<CR>", { noremap = true, silent = true })
end

return M
