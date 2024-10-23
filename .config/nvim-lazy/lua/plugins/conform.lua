return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>r",
				function()
					require("conform").format({ async = true }, function()
						print("Formatted.")
					end)
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				vue = { "eslint_d" },
				json = { "prettierd" },
				xml = { "xmllint" },
				css = { "stylelint" },
				scss = { "stylelint" },
				php = { "php_cs_fixer" },
			},
			notify_on_error = true,
			notify_no_formatters = true,
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}
