-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "doomchad",
}

M.plugins = {
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
    ["windwp/nvim-ts-autotag"] = {},
  },
}

return M
