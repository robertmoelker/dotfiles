return {
  {
		"williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function() 
      require("mason-lspconfig").setup()
    end
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
