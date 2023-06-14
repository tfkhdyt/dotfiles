local nls = require("null-ls")

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			return {
				sources = {
					-- JS and TS
					-- nls.builtins.code_actions.eslint.with({
					-- 	extra_filetypes = { "svelte" },
					-- }),
					-- nls.builtins.diagnostics.eslint.with({
					-- 	extra_filetypes = { "svelte" },
					-- }),
					-- nls.builtins.formatting.eslint_d.with({
					-- 	extra_filetypes = { "svelte" },
					-- }),
					nls.builtins.formatting.rustywind.with({
						extra_filetypes = { "svelte" },
					}),
					-- nls.builtins.formatting.prettierd.with({
					-- 	extra_filetypes = { "svelte" },
					-- }),
					nls.builtins.formatting.prettier.with({
						filetypes = { "html", "css", "svelte" },
					}),

					-- Lua
					nls.builtins.formatting.stylua,

					-- yaml
					nls.builtins.diagnostics.yamllint,
					nls.builtins.formatting.yamlfmt,

					-- C
					-- nls.builtins.diagnostics.cpplint,

					-- Go
					-- nls.builtins.diagnostics.golangci_lint,
					nls.builtins.formatting.gofumpt,
					nls.builtins.formatting.goimports,
					nls.builtins.formatting.goimports_reviser,
					-- nls.builtins.formatting.golines,
					-- nls.builtins.diagnostics.revive,

					-- PHP
					nls.builtins.formatting.phpcsfixer,
					-- nls.builtins.diagnostics.phpcs,

					-- python
					nls.builtins.diagnostics.flake8,
					nls.builtins.formatting.black,

					-- dprint
					nls.builtins.formatting.dprint.with({
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown" },
					}),
				},
			}
		end,
	},
}
