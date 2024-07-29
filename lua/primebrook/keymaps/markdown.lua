local M = {}

function M.setup()
	-- Markdown Preview
	vim.keymap.set("n", "<leader>p", ":MarkdownPreview<CR>", { noremap = true, silent = true })
end

return M
