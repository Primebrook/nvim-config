-- this will be used for ts, js, tsx and jsx files
local M = {}

function M.setup()
	-- format
	vim.keymap.set("n", "<leader>ff", ":!npm run format<CR>", { noremap = true, silent = true, buffer = true })
end

return M
