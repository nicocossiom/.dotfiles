return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>T",
      desc = "+terminals",
    },
    {
      "<leader>Td",
      "<cmd>ToggleTerm<cr>",
      desc = "ToggleTerm",
    },
    {
      "<leader>Tv",
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 0, vim.loop.cwd(), "vertical")
      end,
      desc = "ToggleTerm (vertical)",
    },
    {
      "<leader>Th",
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 10, vim.loop.cwd(), "horizontal")
      end,
      desc = "ToggleTerm (horizontal)",
    },
  },
}
