local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_hide_dotfiles = 0 -- This is to show dotfiles, like .gitignore
vim.g.nvim_tree_gitignore = 0 -- This is to show git ignored files and folders

nvimtree.setup({
	filters = {
		custom = {},
		exclude = {},
		dotfiles = false, -- set to true to hide dotfiles
	},
	git = {
		enable = true,
		ignore = false, -- set to false to show git ignored files
		timeout = 500,
	},
})
