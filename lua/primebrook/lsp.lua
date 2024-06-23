local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	vim.lsp.set_log_level("debug")

	lspconfig.pyright.setup({})
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
	lspconfig.tsserver.setup({
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		cmd = { "typescript-language-server", "--stdio" },
	})
end

return M
