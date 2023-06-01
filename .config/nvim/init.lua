-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd.colorscheme("catppuccin")
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true
vim.opt.colorcolumn = "90"
vim.opt.spell = false

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

vim.filetype.add({ extension = { typ = "typst" } })
vim.g.jsdoc_lehre_path = "/home/tfkhdyt/.local/share/pnpm/lehre"
