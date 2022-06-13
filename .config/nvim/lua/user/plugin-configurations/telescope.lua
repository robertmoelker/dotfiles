local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"vendor",
			"node_modules",
			"bower_components",
			"dist",
			".git",
		},
		mappings = {
			i = {
				["<leader>v"] = actions.select_vertical,
			},
		},
	},
})
require("telescope").load_extension("cder")
