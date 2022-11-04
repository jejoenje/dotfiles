require('packer').startup(function()
  use 'wbthomason/packer.nvim'

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
end)
