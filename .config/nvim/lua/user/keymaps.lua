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
