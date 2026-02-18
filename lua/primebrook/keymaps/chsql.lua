local M = {}

function M.setup()
	-- formatting
	vim.keymap.set("n", "<leader>ff", ":<C-U>%!/Users/brook/zappi/clickhouse/clickhouse format<CR>", { noremap = true, silent = true })
end

return M
