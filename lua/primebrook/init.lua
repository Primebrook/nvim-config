require("primebrook.remap")

local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

-- ensure a given plugin from github.com/<user>/<repo> is cloned i nthe pack/packer/start directory
local function ensure(user, repo)
	local install_path = fmt("%s/packer/start/%s", pack_path, repo)
	if fn.empty(fn.glob(install_path)) > 0 then
		execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
		execute(fmt("packadd %s", repo))
	end
end

-- ensure the plugin manager is installed
ensure("wbthomason", "packer.nvim")

require("packer").startup(function(use)
	--install all the plugins you need here

	-- the plugin manager can manage itself
	use({ "wbthomason/packer.nvim" })

	-- gruvbox theme
	use({ "morhetz/gruvbox" })

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- file explorer
	use({ "nvim-tree/nvim-tree.lua" })

	-- tmux & splot window navigation
	use({ "christoomey/vim-tmux-navigator" })

	--maximizes and restores current window
	use({ "szw/vim-maximizer" })

	-- lsp config
	use({ "neovim/nvim-lspconfig" })

	-- cmp framework for auto-completion support
	use({ "hrsh7th/nvim-cmp" })

	-- install different completion source
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })

	-- you need a snippet engine for snippet support
	-- here I'm using vsnip which can load snippets in vscode format
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-vsnip" })

	-- treesitter for syntax highlighting and more
	use({ "nvim-treesitter/nvim-treesitter" })

	-- harpoon
	use({ "ThePrimeagen/harpoon" })

	-- fugitive
	use({ "tpope/vim-fugitive" })
end)

-- fugitive
vim.g.fugitive_diff_split = "vertical"

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "elixir", "python", "rust", "bash", "json" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})

-- Co-pilot
vim.g.copilot_filetypes = {
	c = false,
}

-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.elixirls.setup({
	cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") },
})
lspconfig.clangd.setup({
	cmd = { vim.fn.expand("/Library/Developer/CommandLineTools/usr/bin/clangd") },
})

-- Setup harpoon
require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
})

-- Setup completion.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- setting up snippet engine
			-- this is for vsnip, if you're using other
			-- snippet engine, please refer to the `nvim-cmp` guide
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "buffer" },
	}),
})
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- THEME
vim.cmd.colorscheme("gruvbox")
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi Folded guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])

local util = require("lspconfig.util")

return {
	default_config = {
		filetypes = { "elixir", "eelixir", "heex", "surface" },
		root_dir = function(fname)
			return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
		end,
	},
	docs = {
		description = [[
		https://github.com/elixir-lsp/elixir-ls

		`elixir-ls` can be installed by following the instructions [here](https://github.com/elixir-lsp/elixir-ls#building-and-running).

		```bash
		curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
		unzip elixir-ls.zip -d /path/to/elixir-ls
		# Unix
		chmod +x /path/to/elixir-ls/language_server.sh
		```

		**By default, elixir-ls doesn't have a `cmd` set.** This is because nvim-lspconfig does not make assumptions about your path. You must add the following to your init.vim or init.lua to set `cmd` to the absolute path ($HOME and ~ are not expanded) of your unzipped elixir-ls.

		```lua
		require'lspconfig'.elixirls.setup{
			-- Unix
			cmd = { "/path/to/elixir-ls/language_server.sh" };
			-- Windows
			cmd = { "/path/to/elixir-ls/language_server.bat" };
			...
		}
		```
		]],
		default_config = {
			root_dir = [[root_pattern("mix.exs", ".git") or vim.loop.os_homedir()]],
		},
	},
}
