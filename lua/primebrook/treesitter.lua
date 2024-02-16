local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "lua", "vim", "elixir", "python", "rust", "bash", "json" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
	})
end

return M
