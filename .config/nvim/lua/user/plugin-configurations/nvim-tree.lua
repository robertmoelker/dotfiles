local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	respect_buf_cwd = true,
  update_cwd = true,
	git = {
		ignore = false,
	},
	update_focused_file = {
		enable = true,
	},
  view = {
    width = 50,
  }
})

-- If no arguments are given by nvim, open the tree by default
vim.cmd('autocmd VimEnter * if !argc() | execute "NvimTreeToggle" | endif')

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
