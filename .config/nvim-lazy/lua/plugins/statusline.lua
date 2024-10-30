return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_a = { {
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				} },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
}
