-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()

        end,
        requires = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
    })

    use({ 'jose-elias-alvarez/null-ls.nvim' })

    use({
        -- https://github.com/adrian5/oceanic-next-vim
        os.getenv("HOME") .. '/.local/share/nvim/site/pack/plugins/start/oceanic-next-vim',
        as = 'oceanicnext',
        config = function()
            vim.cmd('let g:oceanic_transparent_bg = 0')
            vim.cmd('colorscheme oceanicnext')
        end
    })

    use {
        'gelguy/wilder.nvim',
        config = function()
        end,
    }

    use({
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end,
    })
    use('ojroques/nvim-hardline')
    use('crispgm/nvim-tabline')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('eandrju/cellular-automaton.nvim')
    use('tpope/vim-surround')
    use('tpope/vim-fugitive')
    use('airblade/vim-gitgutter')
    use('sindrets/diffview.nvim')
    use { 'ellisonleao/glow.nvim', config = function() require("glow").setup() end }
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
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
end)
