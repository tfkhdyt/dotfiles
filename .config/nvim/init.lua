-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd.colorscheme("catppuccin")
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true

-- LSP
require("lspconfig").bashls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").taplo.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").yamlls.setup({})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = "utf-8"
-- require("lspconfig").clangd.setup({
-- 	capabilities = capabilities,
-- })

-- rust tools
-- local rt = require("rust-tools")
--
-- rt.setup({
-- 	server = {
-- 		on_attach = function(_, bufnr)
-- 			-- Hover actions
-- 			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
-- 			-- Code action groups
-- 			vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
-- 		end,
-- 	},
-- })
--
-- rt.inlay_hints.enable()
