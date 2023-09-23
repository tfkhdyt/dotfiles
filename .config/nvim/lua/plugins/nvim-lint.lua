return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      python = { "flake8" },
      go = { "golangcilint" },
    }
  end,
}
