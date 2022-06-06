local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  vim.cmd('echoerr "cmp.lua not found"')
  return
end

local status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not status_ok then
  vim.cmd('echoerr "cmp_autopairs.lua not found"')
  return
end

local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then
  vim.cmd('echoerr "lspkind not found"')
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp'},
    { name = 'copilot'},
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
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50
    })
  }
})
-- Make sure the autopair will be triggered after the completion
cmp.event:on(
  'confirm_done', 
  cmp_autopairs.on_confirm_done(
    {  
      map_char = { 
        tex = '' 
      } 
    }
  )
)
