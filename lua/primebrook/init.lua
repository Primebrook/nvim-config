require("primebrook.remap")
require("primebrook.plugins")
require("primebrook.treesitter")
require("primebrook.lsp")
require("primebrook.completion")
require("primebrook.nvim_tree")
require("primebrook.harpoon")
require("primebrook.chatgpt")

-- GENERAL
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

-- FUGITIVE
vim.g.fugitive_diff_split = "vertical"

-- CO-PILOT
vim.g.copilot_filetypes = {
	c = false, -- one of these works
	["c"] = false,
}
