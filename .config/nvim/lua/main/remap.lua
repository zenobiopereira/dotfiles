-- Leader equals space.
vim.g.mapleader = " "

-- Go to Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected live DOWN.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selected live UP.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Same as CTRL + J on VScode but with cursor in place.
vim.keymap.set("n", "J", "mzJ`z")

-- Peek end of file with cursor on the middle.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Peek top of file with cursor on the middle.
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Vim With Me.
--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- Make last copy as what will be kept being pasted.
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Copy next mnemonic.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Copy From cursor to end of line.
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete next mnemonic.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Ctrl + C as Esc.
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- New Tmux session.
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format buffer.
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Movement under Quick List.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Movement under Location List.
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Quick replace current word.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
