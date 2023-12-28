local o = vim.opt

o.relativenumber = true
o.number = true
o.scrolloff = 8
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.softtabstop = 2
o.expandtab = true
o.smarttab = true
o.si = true
-- o.nowrap = true
o.ignorecase = true
o.showcmd = true
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.termguicolors = true
o.clipboard = "unnamedplus"
o.title = true
o.titlestring = "%F (%t)"

-- Disable the default mouse
o.mouse = 

-- Overwrite the shiftwidth & tab for PHP files
vim.cmd("autocmd FileType php setlocal shiftwidth=4 tabstop=4 autoindent")

-- Set the filetype for EJS files for highlighting
vim.cmd("autocmd BufRead,BufNewFile *.ejs set filetype=html.js")
vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html.js")
