local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.cmd("echoerr 'Failed to load null-ls'")
  return
end

local sources = {
  null_ls.builtins.formatting.eslint_d.with({
    -- All file types available for eslint_d
    -- Defined for easier to understand the plugins
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
  }),
  null_ls.builtins.formatting.phpcsfixer,
  null_ls.builtins.formatting.prettierd.with({
    filetypes = { 'json', 'css', 'scss', 'html', 'yaml', 'markdown'}
  }),
  null_ls.builtins.diagnostics.phpcs.with({
    extra_args = { '--standard=PSR12' }
  }),
  null_ls.builtins.diagnostics.eslint_d
}

null_ls.setup({ sources = sources })
