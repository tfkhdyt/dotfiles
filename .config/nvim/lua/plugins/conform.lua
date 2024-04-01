return {
	"stevearc/conform.nvim",
	opts = function()
		---@class ConformOpts
		local opts = {
			-- LazyVim will use these options when formatting with the conform.nvim formatter
			format = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
			},
			---@type table<string, conform.FormatterUnit[]>
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				yaml = { "yamlfmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				go = { "gofumpt", "goimports-reviser", "golines" },
				python = { "black" },
				json = { "prettierd" },
				-- sql = { "sqlfmt" },
			},
			-- The options you set here will be merged with the builtin formatters.
			-- You can also define any custom formatters here.
			---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
			formatters = {
				golines = {
					prepend_args = { "--max-len=80" },
				},
				injected = { options = { ignore_errors = true } },
				-- goimports_reviser = {
				-- 	command = "goimports-reviser",
				-- 	args = { "-rm-unused", "-format", "-use-cache", "$FILENAME" },
				-- 	stdin = false,
				-- },
				-- # Example of using dprint only when a dprint.json file is present
				-- dprint = {
				--   condition = function(ctx)
				--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
				--   end,
				-- },
				--
				-- # Example of using shfmt with extra args
				-- shfmt = {
				--   prepend_args = { "-i", "2", "-ci" },
				-- },
			},
		}
		return opts
	end,
}
