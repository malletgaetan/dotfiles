require('packer').startup(function(use)
  -- dope sht
  use 'wbthomason/packer.nvim'
  -- comments
  use 'tpope/vim-commentary'
  -- enhanced highlighting
  use 'nvim-treesitter/nvim-treesitter'
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- theme
  use 'Mofiqul/dracula.nvim'
end)

require('basics')
require('treesitterconf')
require('telescopeconf')
require('dracula')

vim.cmd[[colorscheme dracula]]
