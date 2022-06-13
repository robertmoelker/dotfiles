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
	extensions = {
		cder = {
      prompt_title = 'Find projects',
			dir_command = { "fd", "--type=d", "--max-depth=4", ".", os.getenv("HOME") .. "/Sites" },
			entry_maker = function(line)
				return {
					value = line,
					display = function(entry)
						return " " .. line:gsub(os.getenv("HOME") .. "/Sites/", "~/"), { { { 1, 3 }, "Directory" } }
					end,
					ordinal = line,
				}
			end,
		},
	},
})
require("telescope").load_extension("cder")
