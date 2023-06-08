local wk = require("which-key")

-- Harpoon registers.
wk.register({
    h = {
        name = "Harpoon",
        t = { "Toggle Harpoon UI" },
        a = { "Add buffer to Harpoon" },
        n = { "Go to next file." },
        p = { "Go to Prev file." }
    },
}, { prefix = "<leader>" })


-- Telescope registers.
wk.register({
    ["<leader>pf"] = { "Telescope Find Files." },
    ["<leader>gs"] = { "Telescope Find Git Files." },
    ["<leader>lg"] = { "Telescope Live Grep." },
    ["<leader>ps"] = { "Find term in project." },
    ["<leader>ks"] = { "Show Keymaps." }

})

-- Undotree registers.
wk.register({
    ["<leader>u"] = { "Undotree Toggle." }
})


-- LSP within buffer registers.
wk.register({
    ["<leader>gd"] = { "Go to definition." },
    ["K"] = { "Hover info." },
    ["<leader>vws"] = { "Show workspace symbols." },
    ["<leader>vd"] = { "View Diagnostics." },
    ["<leader>[d"] = { "Next Diagnostics." },
    ["<leader>]d"] = { "Prev Diagnostics." },
    ["<leader>vca"] = { "Code Actions." },
    ["<leader>vrf"] = { "View References." },
    ["<leader>vrn"] = { "Rename current Reference." },
    ["<C-h>"] = { "Signature Helpleader." },
})

-- Vim-Fugitive.
wk.register({
    ["<leader>gs"] = { "Open Vim Fugitive" }
})

-- Highlighting.
wk.register({
    i = {
        name = "Illuminate",
        n = { "Go to Next Highlighting." },
        p = { "Go to Prev Highlighting." },
        s = { "Select highted word under the cursor." }
    },
}, { prefix = "<leader>" })



-- Remaps.
wk.register({
    ["<leader>pv"] = { "Go To File Explorer." },
    ["<C-d>"] = { "Peek end of file with cursor on the middle." },
    ["<C-u>"] = { "Peek top of file with cursor on the middle." },
    ["<leader>pp"] = { "Keep last yank on paste buffer.being pasted" },
    ["<leader>y"] = { "Copy next mnemonic." },
    ["<leader>Y"] = { "Copy From cursor to end of line." },
    ["<leader>d"] = { "Delete next mnemonic." },
    ["<C-k>"] = { "Next entry on Quick List." },
    ["<C-j>"] = { "Prev entry on Quick List." },
    ["<leader>k"] = { "Next entry on Location List." },
    ["<leader>j"] = { "Prev entry on Location List." },
    ["<leader>s"] = { "Quick replace word under cursor." },
    ["<leader>f"] = { "Format buffer." },
})
