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

	-- Colorscheme
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use("tpope/vim-fugitive")
	use("kylechui/nvim-surround")
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

	-- Autocomplete AI
	use({ "zbirenbaum/copilot-cmp", requires = { { "zbirenbaum/copilot.lua" } } })

	-- Snippet plugins
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Formatting & linters
	use({ "nvimtools/none-ls.nvim", requires = { { "nvimtools/none-ls-extras.nvim" } } })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"windwp/nvim-ts-autotag",
		requires = { "nvim-treesitter" },
	})
	use("windwp/nvim-autopairs")

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- NOTE: This will be changed soon to regular `master`
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- use({
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	as = "render-markdown",
	-- 	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	-- })

	-- LOCAL plugin development
	use({ "~/Sites/prive/simple-note.nvim" })
	use({ "folke/neodev.nvim" })
end)
