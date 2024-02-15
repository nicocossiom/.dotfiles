return {
	"Bhanukamax/tman.nvim",
	config = function()
		local tman = require("tman")
		-- This is my favourite way to toggle tman terminal, you don't have to care which mode you are in the terminal, just one keybind to toggle back and forth
		vim.keymap.set("n", "<A-;>", function()
			tman.toggleLast({ insert = true })
		end)
		vim.keymap.set("t", "<A-;>", tman.toggleLast)
		-- toggle terminal from a specific side
		vim.keymap.set("n", "<leader>tr", tman.toggleRight)
		vim.keymap.set("n", "<leader>tb", tman.toggleBottom)

		-- toggle terminal from the last open side
		vim.keymap.set("n", "<leader>tt", tman.toggleLast)

		-- setup how the terminal buffer is displayed
		-- Note: you don't need to do this if you are okay with using the defaults
		tman.setup({
			split = "bottom", -- supported values: "bottom", "right"
			-- set width and height as a percentage of the terminal width and height
			-- should be a integer between 1 to 100
			width = 50, -- default is 50
			height = 40, -- default is 40
		})
	end,
}
