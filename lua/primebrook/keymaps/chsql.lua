local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":<C-U>%!clickhouse format<CR>", { noremap = true, silent = true })
end

return M
