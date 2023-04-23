local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = 'v3.*'}
  use 'tiagovla/scope.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'numToStr/Comment.nvim'
  use 'folke/todo-comments.nvim'
  use 'ethanholz/nvim-lastplace'
  use 'anuvyklack/fold-preview.nvim'
  use 'anuvyklack/keymap-amend.nvim'
  use 'kevinhwang91/nvim-hlslens'
  use 's1n7ax/nvim-search-and-replace'
  use {'akinsho/toggleterm.nvim', tag = '*'}
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'kevinhwang91/nvim-ufo'
  use 'kevinhwang91/promise-async'
  use 'L3MON4D3/LuaSnip'
  use 'folke/trouble.nvim'
  use 'windwp/nvim-autopairs'
  use 'nvim-lua/plenary.nvim'
  use 'stevearc/aerial.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}
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
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
