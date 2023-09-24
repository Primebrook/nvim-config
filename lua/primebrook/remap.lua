vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("Ex")
end, {})

vim.keymap.set("n", "<leader>ff", function()
	vim.cmd("Telescope find_files hidden=true")
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

-- lsp keybindings (note: ideally these keybindings should only be alive for buffers which have lsp's attached to them)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })

-- json formatting
function convert_python_dict_to_json()
	vim.api.nvim_command(":%s/'/\"/g")
	vim.api.nvim_command(":%s/False/false/g")
	vim.api.nvim_command(":%s/True/true/g")
	vim.api.nvim_command(":%s/None/null/g")
end

vim.keymap.set("n", "<leader>cj", ":lua convert_python_dict_to_json()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>jq", "<cmd>%!jq --indent 4 '.'<CR>", { noremap = true, silent = true })
