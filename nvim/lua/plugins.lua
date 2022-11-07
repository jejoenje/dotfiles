-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

require('packer').startup(function()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- alpa-Neovim start screen
  use { 
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- Colourschemes
  use 'tomasr/molokai'
  use "danilo-augusto/vim-afterglow"
  use "shaunsingh/nord.nvim"
  use "arcticicestudio/nord-vim"

  -- IDE
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use "preservim/nerdtree"
  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = function()
      require('cokeline').setup()
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'wsdjeg/Nvim-R'
  use 'ncm2/ncm2'
  use 'roxma/nvim-yarp'
  use 'gaalcaras/ncm-R'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
end)

