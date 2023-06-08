-- Fat cursor.
vim.opt.guicursor = ""

-- Relative numbers.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Make tab identations as spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Line Wrapping.
vim.opt.wrap = false

-- Enablind Undotree to handle all undos.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Doesn't keep Highlight after search.
vim.opt.hlsearch = false
-- Enable incremental search when searching.
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast update time.
vim.opt.updatetime = 50

-- Column to specific ammount of characeters.
-- vim.opt.colorcolumn = "120"
