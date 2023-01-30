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
					nls.builtins.code_actions.eslint_d,
					nls.builtins.diagnostics.eslint_d,
					nls.builtins.formatting.rustywind,
					nls.builtins.formatting.prettierd,

					-- Lua
					nls.builtins.formatting.stylua,

					-- yaml
					nls.builtins.diagnostics.yamllint,
					nls.builtins.formatting.yamlfmt,
				},
			}
		end,
	},
}
