return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup{
        -- app = { "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", "--new-window"}
    }
		-- refer to `configuration to change defaults`
		vim.api.nvim_create_user_command("MarkdownPreviewPeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("MarkdownPreviewPeekClose", require("peek").close, {})
	end,
}
