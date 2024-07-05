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
end

return M
