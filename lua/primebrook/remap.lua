vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })

-- Copying to system clipboard
vim.keymap.set("n", "Y", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "Y", '"+y', { noremap = true, silent = true })

-- Copying current filepath to clipboard
local function copy_to_clipboard(str)
	vim.fn.system("echo " .. str .. " | pbcopy")
end

vim.keymap.set("n", "<leader>fp", function()
	copy_to_clipboard(vim.fn.expand("%:p"))
end, { noremap = true, silent = true })

-- Managing Window Panes
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { noremap = true, silent = true }) -- vim-maximizer

vim.keymap.set("n", "<leader>rh", "<C-w><") -- decrease window width
vim.keymap.set("n", "<leader>rl", "<C-w>>") -- increase window width
vim.keymap.set("n", "<leader>rj", "<C-w>+") -- increase window height
vim.keymap.set("n", "<leader>rk", "<C-w>-") -- decrease window height

-- PLUGIN KEYMAPS

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pw", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

-- Nvim-Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- LSP keybindings (ideally these keybindings should only be alive for buffers which have lsp's attached to them)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })

-- JSON Formatting
function python_dict_to_json()
	vim.api.nvim_command(":%s/'/\"/ge")
	vim.api.nvim_command(":%s/False/false/ge")
	vim.api.nvim_command(":%s/True/true/ge")
	vim.api.nvim_command(":%s/None/null/ge")
end
vim.keymap.set("n", "<leader>tj", ":lua python_dict_to_json()<CR>", { noremap = true, silent = true }) -- tj == "to json"
vim.keymap.set("n", "<leader>jf", "<cmd>%!jq --indent 4 '.'<CR>", { noremap = true, silent = true })

-- sql formatting
vim.keymap.set("n", "<leader>sf", ":<C-U>%!pg_format -<CR>", { noremap = true, silent = true })

-- Fugitive
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gbr", ":Git branch<Space>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gch", ":Git checkout<Space>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gm", ":Git merge<Space>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
function git_push_current_branch()
	local current_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
	vim.cmd("Git push --set-upstream origin " .. current_branch)
end
vim.keymap.set("n", "<leader>gP", ":lua git_push_current_branch()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })

-- Txt list formatting
vim.keymap.set("n", "<leader>tf", ":%s/,/\r/ge<CR>", { noremap = true, silent = true })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu, { noremap = true, silent = true })
