local status, prettier = pcall(require, "prettier")
if not status then
	return
end

prettier.setup({
	bin = "prettier",
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
	},
	cli_options = {
		config_precedence = "prefer-file", -- prefers config files present in root
		arrow_parens = "always",
		bracket_spacing = false,
		bracket_same_line = true,
		embedded_language_formatting = "auto",
		end_of_line = "lf",
		html_whitespace_sensitivity = "css",
		-- jsx_bracket_same_line = false,
		jsx_single_quote = false,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_attribute_per_line = false,
		single_quote = true,
		tab_width = 4,
		trailing_comma = "es5",
		use_tabs = false,
		vue_indent_script_and_style = false,
	},
	-- ["null-ls"] = {
	--   condition = function()
	--     return prettier.config_exists({
	--       -- if `false`, skips checking `package.json` for `"prettier"` key
	--       check_package_json = true,
	--     })
	--   end,
	--   runtime_condition = function(params)
	--     -- return false to skip running prettier
	--     return true
	--   end,
	--   timeout = 5000,
	-- }
})
