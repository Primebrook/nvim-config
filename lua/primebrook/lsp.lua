local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	vim.lsp.set_log_level("debug")

	lspconfig.pyright.setup({
		settings = {
			python = {
				pythonPath = "/Users/brook/.pyenv/versions/garmin/bin/python",
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
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

	-- TypeScript and JavaScript LSP
	-- tsserver IS DEPRECATED USE ts_ls instead
	--	lspconfig.tsserver.setup({
	--		on_attach = function(client)
	--			client.resolved_capabilities.document_formatting = false
	--			client.resolved_capabilities.document_range_formatting = false
	--		end,
	--		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	--		cmd = { "typescript-language-server", "--stdio" },
	--	})

	-- Marksman LSP for Markdown
	lspconfig.marksman.setup({
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
	})
end

return M
