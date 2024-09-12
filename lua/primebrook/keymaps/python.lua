local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":!black . && isort .<CR>", { noremap = true, silent = true })
end

return M
