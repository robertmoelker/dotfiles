local opts = {
  noremap = true,
  silent = true,
}

-- Shorten name to define the keymaps
local keymap = vim.api.nvim_set_keymap

-- Define the leader key
keymap('', ',', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modes that can be used while mapping
--    normal = 'n'
--    visual = 'v'
--    insert = 'i'

-- NORMAL MODE MAPPING --
-- NvimTree keys
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<C-d>', ':NvimTreeFindFile<CR>', opts)

-- Telescope keys
keymap('n', '<leader>f', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>g', ':Telescope live_grep<CR>', opts)

-- Toggleterm
keymap('n', '<leader>t', ':TermExec cmd="cd %:p:h" direction=float<CR>', opts)

-- Easy way to go through buffers
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<A-l>', ':bnext<CR>', opts)
keymap('n', '<A-h>', ':bprevious<CR>', opts)

keymap('n', '<C-f>', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>', opts)

-- Skip the need to press :q to quit
keymap('n', 'qq', ':q<CR>', opts)

-- INSERT MODE MAPPING --
keymap('i', '<C-s>', '<Esc>:w<CR>', opts)
keymap('n', '<C-s>', ':w<CR>', opts)

keymap('n', '<C-j>', '20j', opts)
keymap('n', '<C-k>', '20k', opts)
keymap('i', '<C-j>', '20j', opts)
keymap('i', '<C-k>', '20k', opts)

-- VISUAL MODE MAPPING --
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
keymap('v', 'p', '"_dP', opts)
