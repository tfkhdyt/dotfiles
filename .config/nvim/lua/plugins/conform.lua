return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      yaml = { "yamlfmt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      go = { "gofumpt", "goimports_reviser", "golines" },
    },
    format_after_save = {
      lsp_fallback = true,
    },
    formatters = {
      goimports_reviser = {
        command = "goimports-reviser",
        args = { "-rm-unused", "-format", "-use-cache", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
