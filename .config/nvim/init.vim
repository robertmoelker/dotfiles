" NEOVIM CONFIGURATION FILE
"
" @author Robert Moelker <rmoelker@gmail.com>
" @since  may 2022

let mapleader = ","
set nocompatible
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set ai 			"auto indent
set si 			"smart indent
set nowrap		"don't wrap lines
set ignorecase		"while searching set case insensitive
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set termguicolors

syntax enable

" Plugin manager used - vim-plug
call plug#begin(stdpath('data') . '/plugged')

" Plenary & telescope are used for fuzzy file findings
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Easier syntax highlight - https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Show the line in the bottom of the terminal looking good w/ status
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" File tree plugin
Plug 'kyazdani42/nvim-tree.lua'

" Initiate the colorscheme being used
Plug 'EdenEast/nightfox.nvim'

" Setup autocompletion plugin
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plugin for formatting & linters
Plug 'jose-elias-alvarez/null-ls.nvim'

" Enable github copilot
Plug 'github/copilot.vim'

" Enable toggleterm for easier git commits
Plug 'akinsho/toggleterm.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-commentary'

call plug#end()

autocmd FileType php setlocal shiftwidth=4 tabstop=4

colorscheme nightfox "define the colorscheme

" Setup the lualine in the bottom of the terminal
lua << EOF
require('lualine').setup()
require('nvim-tree').setup{
  git = {
    ignore = false
  },
}
local actions = require('telescope.actions')
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = {"vendor", "node_modules", ".git"}, 
    mappings = {
      i = {
        ['<leader>v'] = actions.select_vertical
      }
    }
  }
}

-- " Inline terminal for easier git usage
require('toggleterm').setup{}

local null_ls = require("null-ls")
local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.phpcsfixer,
  null_ls.builtins.diagnostics.phpcs.with({
    extra_args = { '--standard=PSR12' }
  }),
  null_ls.builtins.code_actions.eslint_d
}

null_ls.setup({ sources = sources })

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp'},
    { name = 'vsnip'},
    { name = 'buffer'}
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['eslint'].setup{
  capabilities = capabilities,
  on_attach = function(client) 
    client.resolved_capabilities.document_formatting = false 
  end,
}

require('lspconfig')['intelephense'].setup{
  capabilities = capabilities,
  on_attach = function(client)  
    client.resolved_capabilities.document_formatting = false
  end,
}


-- Define nvim-autopairs
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

EOF

" Overwrite some keycommands
nnoremap <leader>sv :source $MYVIMRC<CR> "Automatically update config vim

"Find files with telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" Setup keybinding to open a file-editor
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-d> :NvimTreeFindFile<CR>

" Map a few keys to make it easier to go through the buffers
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map key to be able to close without having to escape all the time
inoremap <C-s> <Esc>
nnoremap <C-f> <cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<cr>

" Map keys to be able to scroll quicker through files in both modes(insert and normal)
nnoremap <C-j>  20j
nnoremap <C-k>  20k
inoremap <C-j>  20j
inoremap <C-k>  20k 

" Open terminal in the current directory
nnoremap <leader>t <cmd>TermExec cmd="cd %:p:h" direction=float<cr>

" If no arguments are given by nvim, open the tree by default
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
autocmd VimEnter * if !argc() | execute 'NvimTreeToggle' | endif
