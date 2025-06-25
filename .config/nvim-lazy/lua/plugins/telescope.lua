return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        }
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '--glob', '!.git/',
          },
        },
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Search for string" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffer" },
    },
  },
}
