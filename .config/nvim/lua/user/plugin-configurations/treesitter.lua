-- THIS ONE IS FOR NOW EMPTY
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"php",
		"javascript",
		"json",
		"vue",
		"vim",
		"yaml",
		"regex",
		"phpdoc",
		"lua",
		"html",
		"dockerfile",
		"css",
		"dot",
		"typescript",
	},
	highlight = {
		enable = true,
		disable = { "php" },
	},
	indent = {
		enable = false,
	},
})
