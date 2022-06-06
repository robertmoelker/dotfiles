local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  vim.cmd('echoerr "which-key not found"')
  return
end

which_key.setup({
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 2, 1, 2 }, -- extra window margin [top, right, bottom, left]
    padding = { 3, 2, 3, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 1
  }, 
  layout = {
    spacing = 8
  }
})
