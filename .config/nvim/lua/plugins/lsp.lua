return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- format = { timeout_ms = 2500 },
			diagnostics = {
				update_in_insert = false,
			},
			servers = {
				gopls = {
					keys = {
						-- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
						{ "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
					},
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = false,
								nilness = true,
								unusedparams = true,
								unusedvariable = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							-- completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
			},
		},
	},
}
