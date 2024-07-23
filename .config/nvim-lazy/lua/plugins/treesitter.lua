return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- fetch latest release
	build = ":TSUpdate",
	event = { "VeryLazy" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		auto_install = true,
		additional_vim_regex_highlighting = false,
	}
}
