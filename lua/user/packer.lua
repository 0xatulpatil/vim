local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use {
    'nvim-lualine/lualine.nvim',
	 requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }

-- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

-- Snippets
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

-- LSP 

  --use {
		--"williamboman/mason.nvim",
		--"williamboman/mason-lspconfig.nvim",
--"neovim/nvim-lspconfig",
  --}
  use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
	  -- LSP Support
	  {'neovim/nvim-lspconfig'},             -- Required
	  {                                      -- Optional
	  'williamboman/mason.nvim',
	  run = function()
		pcall(vim.cmd, 'MasonUpdate')
	  end,
	},
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- Autocompletion
	{'hrsh7th/nvim-cmp'},     -- Required
	{'hrsh7th/cmp-nvim-lsp'}, -- Required
	{'L3MON4D3/LuaSnip'},     -- Required
  }
}
  -- Treesitter

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} ) 
-- Telescope

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
-- Autopairs
  use {
	{"windwp/nvim-autopairs"},
	{"windwp/nvim-ts-autotag"}
	 -- config = function() require("nvim-autopairs").setup {} end
  }
-- Commenting 
  use {
	 'numToStr/Comment.nvim'
  }



  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
