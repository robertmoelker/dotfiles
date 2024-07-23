return {
	"mikavilpas/yazi.nvim",
	keys = {
		{
			"<leader>n", function() require("yazi").yazi() end, desc = "File Manager"
		}
	}
}
