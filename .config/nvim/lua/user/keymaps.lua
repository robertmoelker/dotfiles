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
keymap("n", "<leader>f", ":Telescope find_files<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Find file",
})
keymap("n", "<leader>g", ":Telescope live_grep<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Search for string",
})

-- Toggleterm
keymap("n", "<leader>tt", ':TermExec cmd="cd %:p:h && cd ./$(git rev-parse --show-cdup)" direction=float<CR>', {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Open terminal",
})

-- keymap("n", "<leader>tv", ':ToggleTerm size=40 dir=git_dir direction=vertical', {
keymap("n", "<leader>tv", ':TermExec size=90 cmd="cd %:p:h && $(git rev-parse --show-cdup)" direction=vertical<CR>', {
  noremap = opts.noremap,
  silent = opts.silent,
  desc = "Open terminal vertical",
})

keymap("t", "<esc>", "<C-\\><C-n>", opts)

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

-- Easy way to go through buffers
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", {
	noremap = opts.noremap,
	silent = opts.silent,
	desc = "Formatting",
})

-- Skip the need to press :q to quit
keymap("n", "qq", ":q<CR>", opts)

-- INSERT MODE MAPPING --
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("v", "<C-s>", ":w<CR>", opts)

keymap("n", "<C-j>", "20j", opts)
keymap("n", "<C-k>", "20k", opts)
keymap("i", "<C-j>", "20j", opts)
keymap("i", "<C-k>", "20k", opts)

-- VISUAL MODE MAPPING --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK MAPPING --
keymap("x", "<A-j>", ":move '>+<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
