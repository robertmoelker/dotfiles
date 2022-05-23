require('lualine').setup({
  options = {
    globalstatus = true,
    always_divide_middle = false,
  }, 
  sections = {
    lualine_y = {}, 
    lualine_z = {},
    lualine_c = { 
      { 
        function()
          local msg = 'not found'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { _fg = '#ffffff', gui = 'bold' },
      }
    }
  }
})
