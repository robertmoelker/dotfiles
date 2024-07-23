-- Currently available colorschemes
--
-- https://github.com/EdenEast/nightfox.nvim
--
-- >> DARK
-- nordfox
-- nightfox
-- duskfox
-- terafox
--
-- >> LIGHT
-- dayfox
-- dawnfox

-- vim.cmd("colorscheme material")
-- vim.g.material_style="palenight"

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- require("rose-pine").setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = "auto",
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = "moon",
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = true,

-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = "base",
-- 		background_nc = "_experimental_nc",
-- 		panel = "surface",
-- 		panel_nc = "base",
-- 		border = "highlight_med",
-- 		comment = "muted",
-- 		link = "iris",
-- 		punctuation = "subtle",

-- 		error = "love",
-- 		hint = "iris",
-- 		info = "foam",
-- 		warn = "gold",

-- 		headings = {
-- 			h1 = "iris",
-- 			h2 = "foam",
-- 			h3 = "rose",
-- 			h4 = "gold",
-- 			h5 = "pine",
-- 			h6 = "foam",
-- 		},
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},

-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
-- 	highlight_groups = {
-- 		ColorColumn = { bg = "rose" },

-- 		-- Blend colours against the "base" background
-- 		CursorLine = { bg = "foam", blend = 10 },
-- 		StatusLine = { fg = "love", bg = "love", blend = 10 },
-- 	},
-- })

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
	overrides = function(colors)
		local theme = colors.theme
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

-- require("catppuccin")

-- vim.cmd('colorscheme rose-pine')
vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme catppuccin-mocha")
