local M = {}

function M.setup()
	local user = os.getenv("DATA_API_PRODUCTION_POSTGRES_USER")
	local password = os.getenv("DATA_API_PRODUCTION_POSTGRES_PASSWORD")
	local host = os.getenv("DATA_API_PRODUCTION_POSTGRES_HOST")
	local port = os.getenv("DATA_API_PRODUCTION_POSTGRES_PORT")
	local db_name = os.getenv("DATA_API_PRODUCTION_POSTGRES_DB")

	vim.g.dbs = {
		data_api_production = string.format("postgresql://%s:%s@%s:%s/%s", user, password, host, port, db_name),
	}

	-- Set a custom keymap for saving queries in vim-dadbod-ui
    vim.api.nvim_set_keymap('n', '<Leader>s', '<Plug>(DBUI_SaveQuery)', { noremap = true, silent = true })
end

return M
