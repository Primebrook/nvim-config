local M = {}

function M.setup()
	-- Markdown Preview
	vim.keymap.set("n", "<leader>p", ":MarkdownPreview<CR>", { noremap = true, silent = true })

	-- inline latex (for personal blog)
	vim.keymap.set("n", "<leader>il", [[a{% include inline.html eq="" %}<Esc>F"]], { noremap = true, silent = true })
end

return M
