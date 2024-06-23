local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"elixir",
			"python",
			"rust",
			"bash",
			"json",
			"markdown",
			"markdown_inline",
			"yaml",
			"javascript",
			"typescript",
		},
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
		},
	})
end

return M
