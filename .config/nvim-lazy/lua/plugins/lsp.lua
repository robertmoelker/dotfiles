local servers = {
  lua_ls = {},
  ts_ls = {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  },
  biome = {
    cmd = { '/Users/rm/.local/share/pnpm/biome', 'lsp-proxy' },
    root_dir = function()
      -- To support monorepos, biome recommends starting the search for the root from cwd
      -- https://biomejs.dev/guides/big-projects/#use-multiple-configuration-files
      local cwd = vim.fn.getcwd()
      local root_files = { 'biome.json', 'biome.jsonc' }
      local util = require('lspconfig.util')
      root_files = util.insert_package_json(root_files, 'biome', cwd)
      local root_dir = vim.fs.dirname(vim.fs.find(root_files, { path = cwd, upward = true })[1])
      return root_dir
    end,
    workspace_required = true
  },
  gopls = {},
  graphql = {},
  phpactor = {
    init_options = {
      ["php_code_sniffer.enabled"] = true,
      ["php_code_sniffer.bin"] = "/usr/bin/phpcs",
      ["php_code_sniffer.args"] = { "--standard=PSR12" },
    },
    settings = {
      phpactor = {
        completion = {
          enabled = true,
        },
        diagnostics = {
          enabled = true,
        },
        index = {
          enabled = true,
        },
      },
    },
  },
  terraformls = {},
  rust_analyzer = {},
}

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = vim.tbl_keys(servers),
      automatic_enable = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = false,
      })

      -- Extend each server config before explicitly enabling it.
      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      -- Setup autocmd for LSP.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        php = { "phpcs" },
        javascript = { "eslint_d" },
        -- typescript = { "biomejs" },
        vue = { "eslint_d" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      lint.linters.biome = {
        cmd = "biome",
        args = (function()
          local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if git_root and git_root ~= "" then
            return { "check", "--formatter", "json", "--cwd", git_root }
          end
          return { "check", "--formatter", "json" }
        end)(),
        stdin = false,
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_errorformat("%f:%l:%c %m", {
          source = "biome",
          severity = vim.diagnostic.severity.WARN,
        }),
      }

      local phpcs = lint.linters.phpcs
      phpcs.args = {
        "-q",
        "--standard=PSR12",
        "--report=json",
        "-",
      }
      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      -- Show the diagnostic inline in the editor
      vim.diagnostic.config(vim.tbl_deep_extend("force", vim.diagnostic.config(), {
        virtual_text = { pos = "inline" },
      }))
    end,
  },
}
