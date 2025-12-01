local M = {}

function M.setup()
	local util = require("lspconfig.util")

	-- Python
	vim.lsp.config("pyright", {
	  settings = {
		python = {
		  pythonPath = vim.fn.system("which python"):gsub("\n", ""),
		  analysis = {
			typeCheckingMode = "basic",
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
		  }
		},
	  },
	})
	vim.lsp.enable('pyright')


	-- Elixir
	vim.lsp.config("elixirls", {
		cmd = { "/Users/brook/elixir-ls-v0.30.0/language_server.sh" },
		root_dir = function(fname)
			return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
		end,
		filetypes = { "elixir", "eelixir", "heex" },
		-- optional settings
		settings = {},
	})
	vim.lsp.enable("elixirls")


	-- C/C++
	vim.lsp.config("clangd", {
		cmd = { vim.fn.expand("/Library/Developer/CommandLineTools/usr/bin/clangd") },
	})
	vim.lsp.enable("clangd")


	-- Markdown
	vim.lsp.config("marksman", {
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
	})
	vim.lsp.enable("marksman")
end

return M
