local M = {}

function M.setup()
	local function python_dict_to_json()
		vim.api.nvim_command(":%s/'/\"/ge")
		vim.api.nvim_command(":%s/False/false/ge")
		vim.api.nvim_command(":%s/True/true/ge")
		vim.api.nvim_command(":%s/None/null/ge")
	end
	vim.keymap.set("n", "<leader>tj", ":lua python_dict_to_json()<CR>", { noremap = true, silent = true }) -- tj == "to json"
	vim.keymap.set("n", "<leader>fj", "<cmd>%!jq --indent 4 '.'<CR>", { noremap = true, silent = true })
end

return M
