local M = {}

function M.setup()
	require("primebrook.plugins").setup()
	require("primebrook.treesitter").setup()
	require("primebrook.lsp").setup()
	require("primebrook.completion").setup()
	require("primebrook.harpoon").setup()
	require("primebrook.oil").setup()
	require("primebrook.keymaps").setup()
	require("primebrook.vim_dadbod").setup()

	-- GENERAL
	vim.wo.relativenumber = false
	vim.opt.number = true
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.guicursor = "n-v-i-c:block-Cursor"

	-- INDENTATION
	local function set_indentation()
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.tabstop = 2
		vim.opt.expandtab = true
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "sh", "javascript", "typescript", "javascriptreact", "typescriptreact", "ruby" },
		callback = set_indentation,
	})

	-- THEME
	vim.cmd.colorscheme("gruvbox")
	vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi Folded guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi Visual ctermfg=White ctermbg=Grey guibg=#333333 guifg=#ffffff ]])

	-- FUGITIVE
	vim.g.fugitive_diff_split = "vertical"

	-- CO-PILOT
	vim.g.copilot_filetypes = { c = false, markdown = false }
end

return M
