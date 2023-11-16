return {
	"mfussenegger/nvim-lint",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			python = { "flake8" },
			go = { "golangcilint" },
		},
	},
}
