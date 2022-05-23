local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.cmd('echoerr "nvim-autopairs not found"')
  return
end

nvim_autopairs.setup()
