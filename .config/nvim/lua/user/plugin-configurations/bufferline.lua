local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.cmd("echoerr 'bufferline not found'")
  return
end
bufferline.setup()
