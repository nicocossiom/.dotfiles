return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		config = function()
			local cmp = require("cmp")
			local compare = cmp.config.compare

			cmp.setup({
				sources = {
					{ name = "jupynium", priority = 1000 }, -- consider higher priority than LSP
					{ name = "nvim_lsp", priority = 100 },
					-- ...
				},
				sorting = {
					priority_weight = 1.0,
					comparators = {
						compare.score, -- Jupyter kernel completion shows prior to LSP
						compare.recently_used,
						compare.locality,
						-- ...
					},
				},
			})
		end,
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	},
	"rcarriga/nvim-notify", -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
