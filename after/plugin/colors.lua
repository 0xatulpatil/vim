-- local colorscheme = "rose-pine";
--
-- require('rose-pine').setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = 'main',
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = false,
-- 	disable_italics = false,
--
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		background_nc = '_experimental_nc',
-- 		panel = 'surface',
-- 		panel_nc = 'base',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
--
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
--
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' },
--
-- 		-- Blend colours against the "base" background
-- 		CursorLine = { bg = 'foam', blend = 10 },
-- 		StatusLine = { fg = 'rose', bg = 'foam', blend = 10 },
--
-- 		-- By default each group adds to the existing config.
-- 		-- If you only want to set what is written in this config exactly,
-- 		-- you can set the inherit option:
-- 		Search = { bg = 'highlight_high', inherit = false },
-- 	}
-- })
-- vim.cmd('colorscheme rose-pine')
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- -- if not status_ok then
-- --   vim.notify("colorscheme " .. colorscheme .. " not found!")
-- --   return
-- -- end
--
require("catppuccin").setup({
	flavour = "mocha",
	color_overrides = {
		mocha = {
			rosewater = "#ffd7d9",
			flamingo = "#ffb3b8",
			pink = "#ff7eb6",
			mauve = "#d4bbff",
			red = "#c26c40",
			maroon = "#ff8389",
			peach = "#e8792c",
			yellow = "#d7da93",
			green = "#42be65",
			teal = "#3ddbd9",
			sky = "#82cfff",
			sapphire = "#78a9ff",
			blue = "#5895ff",
			lavender = "#8dd6fa",
			text = "#f4f4f4",
			subtext1 = "#e0e0e0",
			subtext0 = "#c6c6c6",
			overlay2 = "#a8a8a8",
			overlay1 = "#8d8d8d",
			overlay0 = "#6f6f6f",
			surface2 = "#525252",
			surface1 = "#393939",
			surface0 = "#262626",
			base = "#161616",
			mantle = "#0b0b0b",
			crust = "#000000",
		},
		macchiato = {
			rosewater = "#ffd7d9",
			flamingo = "#ffb3b8",
			pink = "#ff7eb6",
			red = "#fa4d56",
			maroon = "#ff8389",
			peach = "#ff832b",
			yellow = "#fddc69",
			green = "#42be65",
			teal = "#3ddbd9",
			sky = "#82cfff",
			sapphire = "#78a9ff",
			blue = "#4589ff",
			lavender = "#be95ff",
			mauve = "#d4bbff",
			text = "#f2f4f8",
			subtext1 = "#dde1E6",
			subtext0 = "#c1c7cd",
			overlay2 = "#a2a9b0",
			overlay1 = "#878d96",
			overlay0 = "#697077",
			surface2 = "#4d5358",
			surface1 = "#343a3f",
			surface0 = "#21272a",
			base = "#121619",
			mantle = "#090b0c",
			crust = "#000000",
		},
	},
})
vim.cmd.colorscheme("catppuccin")
