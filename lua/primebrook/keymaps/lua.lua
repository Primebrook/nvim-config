local M = {}

function M.setup()
	-- format
	vim.keymap.set("n", "<leader>ff", ":!stylua .<CR>", { noremap = true, silent = true, buffer = true })
end

return M
