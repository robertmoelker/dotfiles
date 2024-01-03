local status_ok, packer = pcall(require, "packer")
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

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use("folke/todo-comments.nvim") -- used with telescope
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "rose-pine/neovim", as = "rose-pine" })

	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("nvim-tree/nvim-tree.lua")
	use("tpope/vim-commentary")
	use("folke/which-key.nvim")

	-- Autocomplete plugins
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- Snippet plugins
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Formatting & linters
	use("jose-elias-alvarez/null-ls.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

  use({
    "windwp/nvim-ts-autotag",
    requires = {"nvim-treesitter"}
  })

	-- Tabs in the top of the screen based on buffer
	-- use({
	-- 	"akinsho/bufferline.nvim",
	-- 	-- tag = "v2.*",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- })

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- NOTE: This will be changed soon to regular `master`
		requires = { { "nvim-lua/plenary.nvim" } },
	})
end)
