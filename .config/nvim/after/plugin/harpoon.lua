local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Mark file to quick navigation.
vim.keymap.set("n", "<leader>ha", mark.add_file)

-- Quick menu with marked files.
vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu)

-- Navigation
vim.keymap.set("n", "<leader>hn", function() ui.nav_next() end)
vim.keymap.set("n", "<leader>hp", function() ui.nav_prev() end)
