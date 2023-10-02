require("ibl").setup({
	-- for example, context is off by default, use this to turn it on
	enabled = true,
	indent = { char = "│" },
	scope = {
		show_start = false,
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},

	-- highlight = { "Function", "Label" },
})
