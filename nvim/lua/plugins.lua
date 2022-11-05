require('packer').startup(function()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- alpa-Neovim start screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
      vim.api.nvim_set_keymap('n','<c-n>', ":Alpha<cr>", {noremap = true}) 
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
end)
