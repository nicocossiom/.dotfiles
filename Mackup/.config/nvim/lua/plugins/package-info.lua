return {
	"vuki656/package-info.nvim",
	requires = "MunifTanjim/nui.nvim",
	config = function()
		require("package-info").setup({
			autostart = true, -- Whether to autostart when `package.json` is opened
		})
	end,
	keys = {
		{
			"<leader>ns",
			function()
				require("package-info").toggle()
			end,
			desc = "Show package info",
			silent = true,
			noremap = true,
		},
		{
			"<leader>nu",
			function()
				require("package-info").update()
			end,
			desc = "Update package",
			silent = true,
			noremap = true,
		},
		{
			"<leader>nd",
			function()
				require("package-info").delete()
			end,
			desc = "Delete package",
			silent = true,
			noremap = true,
		},
		{
			"<leader>np",
			function()
				require("package-info").change_version()
			end,
			desc = "Install a different package version",
			silent = true,
			noremap = true,
		},
	},
}
