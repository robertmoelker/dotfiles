return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function()
					return {
						-- update kanagawa to handle new treesitter highlight captures
						["@string.regexp"] = { link = "@string.regex" },
						["@variable.parameter"] = { link = "@parameter" },
						["@exception"] = { link = "@exception" },
						["@string.special.symbol"] = { link = "@symbol" },
						["@markup.strong"] = { link = "@text.strong" },
						["@markup.italic"] = { link = "@text.emphasis" },
						["@markup.heading"] = { link = "@text.title" },
						["@markup.raw"] = { link = "@text.literal" },
						["@markup.quote"] = { link = "@text.quote" },
						["@markup.math"] = { link = "@text.math" },
						["@markup.environment"] = { link = "@text.environment" },
						["@markup.environment.name"] = { link = "@text.environment.name" },
						["@markup.link.url"] = { link = "Special" },
						["@markup.link.label"] = { link = "Identifier" },
						["@comment.note"] = { link = "@text.note" },
						["@comment.warning"] = { link = "@text.warning" },
						["@comment.danger"] = { link = "@text.danger" },
						["@diff.plus"] = { link = "@text.diff.add" },
						["@diff.minus"] = { link = "@text.diff.delete" },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
}
