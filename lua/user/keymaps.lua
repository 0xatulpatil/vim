local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.editorconfig = true

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Base Remaps --

keymap("n", "<C-a>", "ggVG", opts)
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "<C-f>", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", opts) -- formatting

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--keymap("n", "<leader>e", ":Lex 30<CR><CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<C-w>", ":BufferLinePickClose<cr>", opts)
--keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", opts)
-- delete buffers/window
keymap("n", "<leader>w", ":b# | bd# <CR>", opts)

-- Search

keymap("n", "<leader>/", ":noh<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
--Insert - Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- high powered remaps from a fancy youtube video
keymap("n", "J", "mzJ`z", opts) -- when you shift-j, cursor remains in place while the lines folds
keymap("n", "<C-d>", "<C-d>zz", opts) -- scroll and keep curson in center
keymap("n", "<C-u>", "<C-u>zz", opts) -- scroll and keep curson in center

keymap("n", "n", "nzzzv", opts) -- keeps curson in middle when searching in files
keymap("n", "N", "Nzzzv", opts)
keymap("x", "<leader>p", '"_dP', opts) -- pastes into void registor,
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)

keymap("n", "<leader>y", '"+y', opts) -- yanks into system clipboard
keymap("v", "<leader>y", '"+y', opts) -- yanks into system clipboard
keymap("n", "<leader>Y", '"+Y', opts) -- yanks into system clipboard
