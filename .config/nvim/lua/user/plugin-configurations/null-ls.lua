local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.cmd("echoerr 'Failed to load null-ls'")
	return
end

local sources = {
	-- Format the filetypes defined in the function
	-- eslint config is mandatory for usage.
  require("none-ls.formatting.eslint_d"),
	-- null_ls.builtins.formatting.eslint_d.with({
	-- 	filetypes = { "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
	-- }),

	-- Formatting for the lua files like this one
	null_ls.builtins.formatting.stylua,

	-- Format PHP code
	-- default code standard = PSR12, no config needed
	null_ls.builtins.formatting.phpcsfixer,

	-- Format linter for filetypes defined ( can be run without config )
	-- without config is reason to have prettierd next to eslint_d
	null_ls.builtins.formatting.prettierd.with({
		filetypes = { "json", "css", "scss", "html", "yaml" },
	}),

	-- PHPCS for requiring PSR12 code standard
	null_ls.builtins.diagnostics.phpcs.with({
		extra_args = { "--standard=PSR12" },
	}),

	-- eslint_d validates the following filetypes
	--  { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
	-- null_ls.builtins.diagnostics.eslint_d,
  require("none-ls.diagnostics.eslint_d"),
  -- null_ls.builtins.diagnostics.prettierd,

	-- yamllint with disable `document-start`
	-- and run on filename instead of `-` which is breaking
	-- the checks
	null_ls.builtins.diagnostics.yamllint.with({
		args = {
			"--format",
			"parsable",
			"$FILENAME",
		},
		extra_args = {
			"-d",
			"{extends: default, rules: {document-start: disable}}",
		},
	}),

	-- jsonlint to check json files based on validation
	-- null_ls.builtins.diagnostics.jsonlint,

  null_ls.builtins.diagnostics.stylelint
}

null_ls.setup({ sources = sources })
