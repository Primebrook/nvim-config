local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	vim.lsp.set_log_level("debug")

	lspconfig.pylsp.setup({
		cmd = { vim.fn.expand("~/.local/bin/pylsp") },
		settings = {
			pylsp = {
				plugins = {
					jedi_hover = { enabled = false }, -- Disable hover if not needed
					jedi_signature_help = { enabled = false }, -- Disable signature help
					jedi_symbols = { enabled = false }, -- Disable workspace symbols
					pylint = { enabled = false }, -- Turn off Pylint if using Ruff
					pyflakes = { enabled = false },
					pycodestyle = { enabled = false },
					ruff = { enabled = true }, -- Use Ruff instead (fast)
					yapf = { enabled = false },
				},
			},
		},
	})

	lspconfig.elixirls.setup({
		cmd = { vim.fn.expand("~/.elixir-ls/language_server.sh") },
		settings = {
			elixirLS = {
				dialyzerEnabled = true,
				-- fetchDeps = false,
			},
		},
	})
	lspconfig.clangd.setup({
		cmd = { vim.fn.expand("/Library/Developer/CommandLineTools/usr/bin/clangd") },
	})

	-- Marksman LSP for Markdown
	lspconfig.marksman.setup({
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
	})
end

return M
