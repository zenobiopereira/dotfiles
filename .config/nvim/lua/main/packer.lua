-- Only required if you have packeran configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    use {
        "folke/tokyonight.nvim",
        as = "tokyonight",
        config = function()
            vim.cmd("colorscheme tokyonight-moon")
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('WhoIsSethDaniel/mason-tool-installer.nvim')

    use {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    svelte = { { "prettierd", "prettier" } },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    javascriptreact = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    graphql = { { "prettierd", "prettier" } },
                    java = { "google-java-format" },
                    kotlin = { "ktlint" },
                    ruby = { "standardrb" },
                    markdown = { { "prettierd", "prettier" } },
                    erb = { "htmlbeautifier" },
                    html = { "htmlbeautifier" },
                    bash = { "beautysh" },
                    proto = { "buf" },
                    rust = { "rustfmt" },
                    yaml = { "yamlfix" },
                    toml = { "taplo" },
                    css = { { "prettierd", "prettier" } },
                    scss = { { "prettierd", "prettier" } },
                },
            })
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use("RRethy/vim-illuminate")

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use('folke/neodev.nvim')

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
end)
