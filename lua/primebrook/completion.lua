local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- setting up snippet engine
			-- this is for vsnip, if you're using other
			-- snippet engine, please refer to the `nvim-cmp` guide
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "buffer" },
	}),
})
