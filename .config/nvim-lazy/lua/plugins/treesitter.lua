return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- fetch latest release
	build = ":TSUpdate",
	event = { "VeryLazy" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  config = function ()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
    })
  end
}
