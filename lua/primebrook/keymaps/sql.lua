local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":<C-U>%!pg_format -<CR>", { noremap = true, silent = true })
end

return M
