return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",

		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "snippet" },
					{ name = "buffer" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})

			-- TODO: Validate if this is still the case
			-- cmp.event:on(
			--   "confirm_done",
			--   cmp_autopairs.on_confirm_done({
			--     map_char = {
			--       tex = "",
			--     },
			--   })
			-- )
		end,
	},
}
