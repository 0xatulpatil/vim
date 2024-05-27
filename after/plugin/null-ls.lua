local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- vim.lsp.buf.format({ timeout_ms = 2000 }) -- to remove the warning of timeout when formatting using null-ls

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({
			extra_args = {
				--	"--no-semi",
				-- "--single-quote",
				-- "--jsx-single-quote",
				"--config-precedence", -- config file has precedence over these custom args
				"prefer-file",
				--"check_package_json"
			},
		}),
		formatting.black.with { extra_args = { "--fast" } },
		formatting.clang_format,
		formatting.stylua,
		formatting.google_java_format,
		formatting.gofumpt,
		formatting.goimports_reviser,

		--  diagnostics.flake8
	},
})



