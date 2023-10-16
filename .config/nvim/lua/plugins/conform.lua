return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  init = function()
    -- Install the conform formatter on VeryLazy
    require("lazyvim.util").on_very_lazy(function()
      require("lazyvim.util").format.custom_format = function(buf)
        return require("conform").format({ bufnr = buf })
      end
    end)
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      yaml = { "yamlfmt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      go = { "gofumpt", "goimports_reviser", "golines" },
      python = { "black" },
    },
    -- format_after_save = {
    --   lsp_fallback = true,
    -- },
    formatters = {
      goimports_reviser = {
        command = "goimports-reviser",
        args = { "-rm-unused", "-format", "-use-cache", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
