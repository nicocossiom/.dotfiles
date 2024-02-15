-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function save()
	local buf = vim.api.nvim_get_current_buf()

	vim.api.nvim_buf_call(buf, function()
		vim.cmd("silent! write")
	end)
end

vim.api.nvim_create_augroup("AutoSave", {
	clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		save()
	end,
	pattern = "*",
	group = "AutoSave",
})

-- when opening vim with argument of file cd into parent dir,
-- if argument is a directory cd into it
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- get vim argument list
		local arg_list = vim.fn.argv()
      -- if there are no arguments do nothing
		if #arg_list == 0 then
			return
		end

		-- get the first argument
		local arg = arg_list[1]
		-- if the argument is a file, get its parents dir
		-- and set it as the current working directory
		if vim.fn.filereadable(arg) == 1 then
			vim.cmd("cd " .. vim.fn.fnamemodify(arg, ":h"))
			return
		end
		-- if its a directory, set it as the current working directory
		if vim.fn.isdirectory(arg) == 1 then
			vim.cmd("cd " .. arg)
			return
		end
	end,
	pattern = "*",
})
