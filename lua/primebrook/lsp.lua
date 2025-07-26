local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	local util = require("lspconfig.util")
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

	lspconfig.lexical.setup({
		cmd = { "/Users/brook/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
		root_dir = function(fname)
			return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
		end,
		filetypes = { "elixir", "eelixir", "heex" },
		-- optional settings
		settings = {},
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
