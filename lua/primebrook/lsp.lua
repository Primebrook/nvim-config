local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.elixirls.setup({
	cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") },
})
lspconfig.clangd.setup({
	cmd = { vim.fn.expand("/Library/Developer/CommandLineTools/usr/bin/clangd") },
})
lspconfig.solargraph.setup({
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
})
