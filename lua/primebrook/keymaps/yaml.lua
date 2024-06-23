local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":!yamlfmt .<CR>", { noremap = true, silent = true })
end

return M
