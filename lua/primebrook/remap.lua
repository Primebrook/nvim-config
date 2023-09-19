vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("Ex")
end, {})
vim.keymap.set("n", "<leader>ff", function()
	vim.cmd("Telescope find_files")
end, {})

-- Copying to system clipboard
vim.keymap.set("n", "Y", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "Y", '"+y', { noremap = true, silent = true })

-- Copying current filepath to clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filepath = vim.fn.expand("%:p")
	vim.fn.system("echo " .. filepath .. " | pbcopy")
end, { noremap = true, silent = true })

-- Managing Window Panes
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- plugin keymaps

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { noremap = true, silent = true })
