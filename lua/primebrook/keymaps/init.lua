local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "elixir",
		callback = function()
			require("primebrook.keymaps.elixir").setup()
		end,
	})
	require("primebrook.keymaps.global").setup()
	-- You can add more requires here as you add more configuration files
end

return M
