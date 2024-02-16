local M = {}

function M.setup()
	-- Prefix w/ pipeline: current line
	vim.keymap.set("n", "<leader>pp", "I|> ", { noremap = true, silent = true, buffer = true })
	-- Prefix w/ pipeline: visual selection
	vim.keymap.set("v", "<leader>pp", ":'<,'>norm I|> <Esc>", { noremap = true, silent = true, buffer = true })

	-- Mix format
	vim.keymap.set("n", "<leader>ff", ":!mix format<CR>", { noremap = true, silent = true, buffer = true })
end

return M
