local nvim_tree = require("nvim-tree")

-- Disable default `netrw` plugin (pre-installed)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	filters = {
		git_ignored = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 50,
	},
	-- renderer = {
	-- 	icons = {
	-- 		web_devicons = {
	-- 			file = {
	-- 				enable = false,
	-- 				color = false,
	-- 			},
	-- 			folder = {
	-- 				enable = false,
	-- 				color = false,
	-- 			},
	-- 		},
	-- 		git_placement = "before",
	-- 		modified_placement = "after",
	-- 		diagnostics_placement = "signcolumn",
	-- 		bookmarks_placement = "signcolumn",
	-- 		padding = " ",
	-- 		symlink_arrow = " ➛ ",
	-- 		show = {
	-- 			file = true,
	-- 			folder = true,
	-- 			folder_arrow = true,
	-- 			git = false,
	-- 			modified = false,
	-- 			diagnostics = false,
	-- 			bookmarks = false,
	-- 		},
	-- 		glyphs = {
	-- 			default = "",
	-- 			symlink = "",
	-- 			bookmark = "󰆤",
	-- 			modified = "●",
	-- 			folder = {
	-- 				arrow_closed = "",
	-- 				arrow_open = "",
	-- 				default = "",
	-- 				open = "",
	-- 				empty = "",
	-- 				empty_open = "",
	-- 				symlink = "",
	-- 				symlink_open = "",
	-- 			},
	-- 			git = {
	-- 				unstaged = "✗",
	-- 				staged = "✓",
	-- 				unmerged = "",
	-- 				renamed = "➜",
	-- 				untracked = "★",
	-- 				deleted = "",
	-- 				ignored = "◌",
	-- 			},
	-- 		},
	-- 	},
	-- },
})

-- If no arguments are given by nvim, open the tree by default
-- vim.cmd('autocmd VimEnter * if !argc() | execute "NvimTreeToggle" | endif')

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
