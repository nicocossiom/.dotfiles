return {
  "Pocco81/auto-save.nvim",
  config = function()
    require('auto-save').setup({
      debounce_delay = 500, -- saves the file at most every `debounce_delay` milliseconds

    })
  end,
}
