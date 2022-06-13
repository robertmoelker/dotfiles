local o = vim.opt

o.number = true
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

-- Overwrite the shiftwidth & tab for PHP files
vim.cmd("autocmd FileType php setlocal shiftwidth=4 tabstop=4 autoindent")
