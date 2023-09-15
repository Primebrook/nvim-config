vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("Ex")
end, {})
vim.keymap.set("n", "<leader>ff", function()
	vim.cmd("Telescope find_files")
end, {})

vim.keymap.set("n", "<leader>test", function()
	local current_file_path = vim.fn.expand("%")
	local file_ext = vim.fn.expand("%:e")
	local test_commands = {
		exs = "mix test",
		py = "make test"
	}
	
	local test_cmd = test_commands[file_ext] .. " " .. current_file_path

	if test_cmd then
		vim.cmd("terminal " .. test_cmd)
	else
		print("No test command for this file extension")
	end
end, {})

-- Copying to system clipboard
vim.keymap.set('n', 'Y', '"+yy', { noremap = true, silent = true })
vim.keymap.set('v', 'Y', '"+y', { noremap = true, silent = true })

-- Managing Window Panes
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- plugin keymaps

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
