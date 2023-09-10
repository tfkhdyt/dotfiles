local nls = require("null-ls")

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			return {
				sources = {
					nls.builtins.formatting.rustywind.with({
						extra_filetypes = { "svelte" },
					}),
					nls.builtins.formatting.prettierd,

					-- Lua
					nls.builtins.formatting.stylua,

					-- yaml
					nls.builtins.diagnostics.yamllint,
					nls.builtins.formatting.yamlfmt,

					-- Go
					nls.builtins.formatting.gofumpt,
					nls.builtins.formatting.goimports_reviser,
					nls.builtins.code_actions.gomodifytags,
					nls.builtins.code_actions.impl,

					-- PHP
					nls.builtins.diagnostics.phpcs,
					nls.builtins.formatting.phpcbf,

					-- python
					nls.builtins.diagnostics.flake8,
					nls.builtins.formatting.black,

					-- dprint
					-- nls.builtins.formatting.dprint.with({
					-- 	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					-- }),

					-- docker
					nls.builtins.diagnostics.hadolint,
				},
			}
		end,
	},
}
