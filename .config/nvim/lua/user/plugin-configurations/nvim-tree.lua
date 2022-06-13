require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	update_focused_file = {
		enable = true,
	},
})

-- If no arguments are given by nvim, open the tree by default
vim.cmd('autocmd BufEnter * ++nested if winnr("$") == 1 && bufname() == "NvimTree_" . tabpagenr() | quit | endif')
vim.cmd('autocmd VimEnter * if !argc() | execute "NvimTreeToggle" | endif')
