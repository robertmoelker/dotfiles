local status_ok, packer = pcall(require, 'packer')
if not status_ok then
   return
end

-- Autocommand that reloads neovim whenever you save the plugins lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'EdenEast/nightfox.nvim'
  use 'github/copilot.vim'
  use 'akinsho/toggleterm.nvim'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-commentary'

  -- Autocomplete plugins
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  
  -- Snippet plugins
  use 'hrs7th/cmp-vsnip'
  use 'hrs7th/vim-vsnip'

   -- Formatting & linters
  use 'jose-elias-alvarez/null-ls.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'akinsho/bufferline.nvim', 
    tag = "v2.*", 
    requires = 'kyazdani42/nvim-web-devicons'
  }
end)
