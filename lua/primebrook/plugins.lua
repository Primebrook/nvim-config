local M = {}

function M.setup()
	local execute = vim.api.nvim_command
	local fn = vim.fn
	local fmt = string.format

	local pack_path = fn.stdpath("data") .. "/site/pack"

	-- ensure a given plugin from github.com/<user>/<repo> is cloned in the pack/packer/start directory
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

		-- oil nvim
		use({ "stevearc/oil.nvim" })

		-- makrdown preview
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})
	end)
end

return M
