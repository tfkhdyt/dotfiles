return {
	"mfussenegger/nvim-lint",
	event = "BufReadPost",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			python = { "flake8" },
			go = { "golangcilint" },
		},
	},
}
