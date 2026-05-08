return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>r",
        function()
          require("conform").format({ async = true }, function()
            print("Formatted.")
          end)
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        -- bicep = { "bicep" },
        -- bicep = false,
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "eslint_d" },
        typescript = { "biome-check" },
        vue = { "eslint_d" },
        json = { "prettierd" },
        xml = { "xmllint" },
        css = { "stylelint" },
        scss = { "stylelint" },
        php = { "php_cs_fixer" },
      },
      -- formatters = {
      --   bicep = function()
      --     -- print("filename", vim.api.nvim_buf_get_name(0))
      --     return {
      --       exe = "bicep",
      --       args = { "format", "-" },
      --       stdin = true,
      --       -- stdout = false,
      --     }
      --   end,
      -- },

      formatters = {
        ["biome-organize-imports"] = {
          args = {
            "check",
            "--write",
            "--formatter-enabled=false",
            "--linter-enabled=false",
            "--assists-enabled=true",
            "--stdin-file-path",
            "$FILENAME",
          },
        },
      },
      notify_on_error = true,
      notify_no_formatters = true,
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 3000,
      },
    },
  },
}
