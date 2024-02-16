local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>fs", ":<C-U>%!pg_format -<CR>", { noremap = true, silent = true })
end

return M
