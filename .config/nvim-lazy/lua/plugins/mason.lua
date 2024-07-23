return {
  {
		"williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
			require("lspconfig").tsserver.setup{}
			require("lspconfig").lua_ls.setup{}
			require("lspconfig").phpactor.setup{}
			require("lspconfig").gopls.setup{}
    end
  },
}
