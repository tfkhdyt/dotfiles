return {
	"mfussenegger/nvim-lint",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			python = { "flake8" },
			-- go = { "golangcilint" },
			-- javascript = { "biomejs" },
			-- typescript = { "biomejs" },
			-- javascriptreact = { "biomejs" },
			-- typescriptreact = { "biomejs" },
			dockerfile = { "hadolint" },
			yaml = { "yamllint" },
			cpp = { "cpplint" },
		},
		---@type table<string,table>
		linters = {
			-- -- Example of using selene only when a selene.toml file is present
			-- selene = {
			--   -- `condition` is another LazyVim extension that allows you to
			--   -- dynamically enable/disable linters based on the context.
			--   condition = function(ctx)
			--     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
			--   end,
			-- },
			yamllint = {
				args = {
					"-d",
					"{extends: default, rules: {document-start: false}}",
					"--format",
					"parsable",
					"-",
				},
			},
		},
	},
}
