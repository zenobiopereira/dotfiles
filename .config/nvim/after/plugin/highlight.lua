local hightlight = require('illuminate');

vim.keymap.set("n", "<leader>in", hightlight.goto_next_reference)
vim.keymap.set("n", "<leader>ip", hightlight.goto_prev_reference)
vim.keymap.set("n", "<leader>is", hightlight.textobj_select)
