return {
  {
    "folke/which-key.nvim",
    lazy = true,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Show keys"
      }
    }
  },
}
