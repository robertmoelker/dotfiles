local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.cmd("echoerr 'Failed to load null-ls'")
  return
end

local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.phpcsfixer,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.diagnostics.phpcs.with({
    extra_args = { '--standard=PSR12' }
  }),
  null_ls.builtins.diagnostics.eslint_d,
}

null_ls.setup({ sources = sources })
