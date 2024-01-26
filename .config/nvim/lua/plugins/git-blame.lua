return {
	{
		"f-person/git-blame.nvim",
		enabled = true,
		config = function()
			vim.g.gitblame_date_format = "%a %d %b %y %H:%M"
		end,
	},
}
