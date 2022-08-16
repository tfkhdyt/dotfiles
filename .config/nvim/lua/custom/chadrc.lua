-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
	theme = "gruvbox",
}

M.plugins = {
	user = {
		["windwp/nvim-ts-autotag"] = {},
    ["pangloss/vim-javascript"] = {},
    ["leafgarland/typescript-vim"] = {},
    ["famiu/nvim-reload"] = {},
    ["peitalin/vim-jsx-typescript"] = {},
	},
}

return M
