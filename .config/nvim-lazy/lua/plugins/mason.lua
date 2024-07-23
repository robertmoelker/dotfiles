return {
  {
		"williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
			require("lspconfig").tsserver.setup()
			require("lspconfig").lua_ls.setup()
			require("lspconfig").phpactor.setup()
			require("lspconfig").gopls.setup()
    end,
  },
}
