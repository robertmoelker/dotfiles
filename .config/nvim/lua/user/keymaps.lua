local opts = {
	noremap = true,
	silent = true,
}

-- Shorten name to define the keymaps
local keymap = vim.api.nvim_set_keymap

-- Define the leader key
keymap("n", "<SPACE>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes that can be used while mapping
--    normal       = 'n'
--    visual       = 'v'
--    insert       = 'i'
--    visual_block = 'x'

-- NORMAL MODE MAPPING --
-- NvimTree keys
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>d", ":NvimTreeFindFile<CR>", opts)

-- Telescope keys
keymap("n", "<leader>ff", ":Telescope find_files<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Find file",
})
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Search for string",
})
keymap("n", "<leader>fn", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Open file browser",
})
keymap("n", "<leader>fb", ":Telescope buffers<CR>", {
  noremap = opts.noremap,
  silent = opts.silent,
  desc = "Find buffer",
})
keymap("n", "<leader>ft", ":TodoTelescope<CR>", {
  noremap = opts.noremap,
  silent = opts.silent,
  desc = "Find todos/comments",
})


keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-s>", "<C-\\><C-n>", opts)

keymap("n", "<leader>i", "<cmd>lua vim.lsp.buf.hover()<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Show LSP info",
})

keymap("n", "<leader>p", ":Telescope cder<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Find project",
})

-- Scroll remaps (centers cursor)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Easy way to go through buffers
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

keymap("n", "<leader>bn", ":bnext<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Buffer next",
})
keymap("n", "<leader>bp", ":bprevious<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Buffer previous",
})
keymap("n", "<leader>bd", ":bdelete<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Buffer delete",
})
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Formatting",
})

-- Skip the need to press :q to quit
keymap("n", "qq", ":q!<CR>", opts)

-- INSERT MODE MAPPING --
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("v", "<C-s>", ":w<CR>", opts)

-- VISUAL MODE MAPPING --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK MAPPING --
keymap("x", "<A-j>", ":move '>+<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

