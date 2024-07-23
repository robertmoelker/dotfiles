-- THIS ONE IS FOR NOW EMPTY
-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = {
-- 		"php",
-- 		"javascript",
-- 		"json",
-- 		"vue",
-- 		"vim",
-- 		"yaml",
-- 		"regex",
-- 		"phpdoc",
-- 		"lua",
-- 		"html",
-- 		"dockerfile",
-- 		"css",
-- 		"dot",
-- 		"typescript",
-- 	},
-- 	highlight = {
-- 		enable = true,
-- 	},
-- 	indent = {
-- 		enable = false,
-- 	},
-- })

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
    "markdown",
    "css",
    "dot",
    "typescript",
  },
  sync_install = false,
	highlight = {
		enable = true,
    additional_vim_regex_highlighting = false,
	},
  ignore_install = {},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
	auto_install = true,
})

require("ts_context_commentstring").setup({})

-- Lets setup the js for the `ejs` files from FormIO.
vim.treesitter.language.register("javascript", "ejs")
