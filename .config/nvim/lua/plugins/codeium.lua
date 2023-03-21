return {
	"Exafunction/codeium.vim",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		-- vim.keymap.set("i", "<C-]>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](1)
		-- end, { expr = true })
		-- vim.keymap.set("i", "<C-[>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](-1)
		-- end, { expr = true })
		-- vim.keymap.set("i", "<C-x>", function()
		-- 	return vim.fn["codeium#Clear"]()
		-- end, { expr = true })
	end,
	enabled = true,
}
