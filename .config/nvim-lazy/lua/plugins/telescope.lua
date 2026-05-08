local function find_files_from_git_root()
  local builtin = require("telescope.builtin")
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if vim.v.shell_error == 0 and git_root ~= nil and git_root ~= "" then
    builtin.find_files({ cwd = git_root })
  else
    builtin.find_files()
  end
end

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
        live_grep = {
          additional_args = function()
            return { '--hidden', '--glob', '!.git/' }
          end
        }
      },
    },
    keys = {
      { "<leader>ff", find_files_from_git_root,        desc = "Find Files (git)" },
      { "<leader>fd", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Search for string" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffer" },
    },
  },
}
