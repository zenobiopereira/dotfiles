function Color(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)

    -- 	Make background transparent.
   -- vim.api.nvim_set_hl(0, "Normal", { bg = "None" } )
   -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" } )
end

Color()
