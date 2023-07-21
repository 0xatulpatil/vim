local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- list files in current working directory
vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- fuzzy search through your git repo

--vim.keymap.set('n', '<leader>fs',function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ")})
-- end) -- fuzzy search through your git repo
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {}) -- list files in current working directory
