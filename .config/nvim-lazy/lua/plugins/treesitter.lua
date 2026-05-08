return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local group = vim.api.nvim_create_augroup("nvim-treesitter", { clear = true })
    local languages = { "javascript", "jsdoc", "tsx", "typescript" }

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
          return
        end

        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
