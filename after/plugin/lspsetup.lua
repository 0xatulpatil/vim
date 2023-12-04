require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			completeUnimported = true,
			gofumpt = true,
			usePlaceholders = true,
		},
	},
})
