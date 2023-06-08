local builtin = require('telescope.builtin')

-- Find Project Files.
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Find Git Files.
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- Live Grep
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Search in project
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Term to search > ") });
end)

-- Show Keymaps.
vim.keymap.set('n', '<leader>ks', builtin.keymaps, {}) -- Show Keymaps
