-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"
vim.g.root_spec = { "cwd" }
vim.api.nvim_set_var("terminal_emulator", "fish")
vim.opt.shell = "fish"
