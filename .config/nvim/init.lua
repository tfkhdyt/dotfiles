-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd.colorscheme("catppuccin")
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true
vim.opt.colorcolumn = "80"
vim.opt.fillchars:append("eob: ")

vim.filetype.add({ extension = { typ = "typst" } })
vim.g.jsdoc_lehre_path = "/home/tfkhdyt/.local/share/pnpm/lehre"

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono NF:h13" -- text below applies for VimScript
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	-- vim.g.neovide_fullscreen = true

	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.25)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.25)
	end)

	vim.keymap.set("n", "<sc-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<sc-c>", '"+y') -- Copy
	vim.keymap.set("n", "<sc-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<sc-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<sc-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<sc-v>", '<ESC>l"+Pli') -- Paste insert mode

	vim.g.neovide_remember_window_size = false

	vim.g.neovide_text_gamma = 0.8
	vim.g.neovide_text_contrast = 0.1
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<sc-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<sc-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<sc-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<sc-v>", "<C-R>+", { noremap = true, silent = true })
