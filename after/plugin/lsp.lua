require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver" },
})

-- Configure diagnostic display for each severity level
vim.diagnostic.config({
	underline = {
		-- severity = { max = vim.diagnostic.severity.INFO },
	},
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	signs = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	float = {
		source = "always",
		severity = { min = vim.diagnostic.severity.INFO },
	},
})

-- To disable diagnostic errors in-line and enable them on hover
-- vim.diagnostic.config({
-- 	severity_sort = true,
-- 	display = {
-- 		hint = {virtual_text = false},
-- 		info = {virtual_text = false},
-- 		warning = {virtual_text = false},
-- 		error = {virtual_text = true},
-- 	}
-- })

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]



-- custom symbols for diagnostics
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- keymaps to browse between diagnostics (errors and warnings)
vim.api.nvim_set_keymap("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- clangd warning --
local cmp_nvim_lsp = require("cmp_nvim_lsp")

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	capabilities = cmp_nvim_lsp.default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float(0, {scope = "cursor", focusable = false, close_events={"InsertCharPre","BufHidden","CursorMoved","CursorMovedI",}})<CR>',
  { noremap = true, silent = true }
)

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end
-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
