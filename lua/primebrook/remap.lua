vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end, {})
vim.keymap.set("n", "<leader>ff", function() vim.cmd("Telescope find_files") end, {})
vim.keymap.set("n", "<leader>test", function() vim.cmd("terminal mix test") end, {}) -- hardcoding for elixir atm

