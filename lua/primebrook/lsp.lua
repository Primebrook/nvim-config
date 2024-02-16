local M = {}

function M.setup()
	local lspconfig = require("lspconfig")

	lspconfig.pyright.setup({})
	lspconfig.rust_analyzer.setup({
		cmd = { vim.fn.expand("~/.config/nvim/language_servers/rust-analyzer-aarch64-apple-darwin") },
	})
	lspconfig.elixirls.setup({
		cmd = { vim.fn.expand("~/.config/nvim/language_servers/elixir-ls/language_server.sh") },
	})
	lspconfig.clangd.setup({
		cmd = { vim.fn.expand("/Library/Developer/CommandLineTools/usr/bin/clangd") },
	})
	lspconfig.tsserver.setup({})
end

return M
