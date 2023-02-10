return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					-- JS and TS
					nls.builtins.code_actions.eslint_d.with({
						extra_filetypes = { "svelte" },
					}),
					nls.builtins.diagnostics.eslint_d.with({
						extra_filetypes = { "svelte" },
					}),
					nls.builtins.formatting.rustywind.with({
						extra_filetypes = { "svelte" },
					}),
					nls.builtins.formatting.prettierd.with({
						extra_filetypes = { "svelte" },
					}),

					-- Lua
					nls.builtins.formatting.stylua,

					-- yaml
					nls.builtins.diagnostics.yamllint,
					nls.builtins.formatting.yamlfmt,

					-- C
					nls.builtins.diagnostics.cpplint,
				},
			}
		end,
	},
}
