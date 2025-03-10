local function get_global_npm_path()
	local handle = io.popen("npm root -g")
	if handle then
		local result = handle:read("*a"):gsub("%s+$", "") -- Remove trailing whitespace
		handle:close()
		return result
	end
	return nil
end

local vue_language_server_path = get_global_npm_path() .. "/node_modules/@vue/language-server"

local servers = {
	lua_ls = {},
	ts_ls = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_language_server_path,
					languages = { "vue" },
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	},
	gopls = {},
	phpactor = {
		init_options = {
			["php_code_sniffer.enabled"] = true,
			["php_code_sniffer.bin"] = "/usr/bin/phpcs",
			["php_code_sniffer.args"] = { "--standard=PSR12" },
		},
		settings = {
			phpactor = {
				completion = {
					enabled = true,
				},
				diagnostics = {
					enabled = true,
				},
				index = {
					enabled = true,
				},
			},
		},
	},
	rust_analyzer = {},
	volar = {},
}

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = vim.tbl_keys(servers),
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Ensure the Mason package manager is set up
			-- require("mason").setup()
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			-- Set up each server
			for server, config in pairs(servers) do
				lspconfig[server].setup(config)
			end

			-- Setup autocmd for LSP.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				php = { "phpcs" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				vue = { "eslint_d" },
			},
		},
		config = function(_, opts)
			require("lint").linters_by_ft = opts.linters_by_ft

			local phpcs = require("lint").linters.phpcs
			phpcs.args = {
				"-q",
				"--standard=PSR12",
				"--report=json",
				"-",
			}

			vim.api.nvim_create_autocmd(opts.events, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
