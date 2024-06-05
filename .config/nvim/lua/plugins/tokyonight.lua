return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			local hour = tonumber(os.date("%H"))
			local style = "night"

			if hour >= 4 and hour <= 12 then
				style = "day"
			end

			return {
				style = style,
			}
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
