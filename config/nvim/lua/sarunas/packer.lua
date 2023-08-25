-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        as = 'treesitter',
        commit = '226c1475a46a2ef6d840af9caa0117a439465500',
        {run = ':TSUpdate'}
    })

    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

-- trim files on save
use('cappyzawa/trim.nvim')

-- Zen focus mode <leader>zz
use('folke/zen-mode.nvim')
-- Debuger
use('puremourning/vimspector')
-- Floating terminal
use ('voldikss/vim-floaterm')
-- TODO, Notes etc
use {
    'folke/todo-comments.nvim',
    config = function()
        require('todo-comments').setup()
    end,
    requires = {
        {'nvim-lua/plenary.nvim'},
    }
}
-- Comments
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
-- Vim Tree
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
-- Copilot
-- use("github/copilot.vim")
end)

