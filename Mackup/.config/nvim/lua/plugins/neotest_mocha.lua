return {
  { "adrigzr/neotest-mocha" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-mocha"] = {
          command = "npm run test:types",
          env = { CI = true },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
