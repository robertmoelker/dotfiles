local opts = { silent = true, remap = false }

-- Set the leader to `<space>`
vim.keymap.set("n", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set the vim options
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.si = true
vim.opt.ignorecase = true
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.title = true
vim.opt.titlestring = "%F (%t)"
vim.opt.list = true
vim.opt.listchars = "tab:❘⠀,trail:·,extends:→,precedes:←,nbsp:␣"
vim.opt.cmdheight = 0

-- Set the custom keymappings
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("n", "qq", ":q!<cr>", opts) -- force quit
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float(nil, { scope = 'cursor' })<cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

-- Overwrite the defaults based per filetype
vim.cmd("autocmd FileType php setlocal shiftwidth=4 tabstop=4 autoindent")
vim.cmd("autocmd FileType go setlocal shiftwidth=4 tabstop=4 autoindent noexpandtab")

-- Set the filetype for EJS files for highlighting
vim.cmd("autocmd BufRead,BufNewFile *.ejs set filetype=ejs.html")
vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html.js")
