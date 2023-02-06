-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd.colorscheme("catppuccin")
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = "utf-8"
require("lspconfig").clangd.setup({
  capabilities = capabilities,
})
