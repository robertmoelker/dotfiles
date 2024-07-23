return {
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

  vim.keymap.set("n", "<leader>ht", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, { desc = "Toggle Harpoon" })

  vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
  end, { desc = "Add to Harpoon" })

  vim.keymap.set("n", "<C-j>", function()
    harpoon:list():select(1)
  end)

  vim.keymap.set("n", "<C-k>", function()
    harpoon:list():select(2)
  end)

  vim.keymap.set("n", "<C-l>", function()
    harpoon:list():select(3)
  end)

  vim.keymap.set("n", "<C-;>", function()
    harpoon:list():select(4)
  end)
      end
  }
}
