--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- Additional Plugins
lvim.plugins = {
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end
  },
  -- {
  --   "windwp/nvim-spectre",
  --   event = "BufRead",
  --   config = function()
  --     require("spectre").setup()
  --   end,
  -- },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "wakatime/vim-wakatime"
  },
  {
    "dkarter/bullets.vim"
  },
  {
    'kristijanhusak/vim-carbon-now-sh'
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "dosini", "i3config" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   -- event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}

lvim.builtin.treesitter.rainbow.enable = true

-- general
lvim.log.level = "warn"
-- lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin-mocha"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.breadcrumbs.active = false
-- lvim.builtin.breadcrumbs.options.depth_limit = 3

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
-- lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = true
-- lvim.builtin.treesitter.indent.enable = true


-- generic LSP settings
-- lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
---@diagnostic disable-next-line: missing-parameter
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jedi_language_server", "emmet_ls", "eslint", "marksman" })
-- require("lvim.lsp.manager").setup("pylsp", {
--   plugins = {
--     flake8 = {
--       enabled = true
--     }
--   }
-- })
require("lvim.lsp.manager").setup("tsserver")
-- require("lvim.lsp.manager").setup("eslint")
require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("phpactor")
require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("rust_analyzer")
require("lvim.lsp.manager").setup("pasls")
-- require("lvim.lsp.manager").setup("tailwindcss")

--[[ require("lvim.lsp.manager").setup("eslint", {
  settings = {
    -- autoFixOnSave = true,
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
  }
}) ]]
-- require("lvim.lsp.manager").setup("marksman", {})
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")
-- require'lspconfig'.jedi_language_server
-- require("lvim.lsp.manager").setup("pylsp")
-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "eslint"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "jedi_language_server"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "eslint_d",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--single-quote", "--jsx-single-quote", "--semi" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
    -- "jsonc", "markdown.mdx", "graphql", "handlebars" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
  },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--single-quote", "--jsx-single-quote", "--semi" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
      "jsonc", "markdown.mdx", "graphql", "handlebars", "svelte" },
    -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
  },
  {
    name = "gofumpt",
    filetypes = { "go" }
  },
  {
    name = "fixjson",
    filetypes = { "json" }
  },
  {
    name = "markdownlint",
    filetypes = { "markdown" }
  },
  {
    name = "black",
    filetypes = { "python" }
  },
  {
    name = "yamlfmt",
    filetypes = { "yaml" }
  },
  {
    command = "phpcsfixer",
    filetypes = { "php" }
  }
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
  { command = "markdownlint", filetypes = { "markdown" } },
  { command = "jsonlint", filetypes = { "json" } },
  { command = "tsc", filetypes = { "typescript", "typescriptreact" } },
  -- { command = "phpcs", filetypes = { "php" } },
  { command = "yamllint", filetypes = { "yaml" }, extra_args = { "-d", "relaxed" } },
  -- {
  --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "shellcheck",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--severity", "warning" },
  -- },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "eslint_d",
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" }
  },
  -- {
  --   name = "refactoring",
  -- },
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 5000 }
  end,
  "Format",
}
-- require("lvim.lsp.utils").format { timeout_ms = 5000 }
-- vim.lsp.buf.format({ timeout_ms = 5000 })
-- local lspconfig = require('lspconfig')
-- -- local configs = require('lspconfig/configs')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.emmet_ls.setup({
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
-- vim.cmd([[
-- if exists("g:neovide")
--   " Put anything you want to happen only in Neovide here
--   set guifont=JetBrainsMono_Nerd_Font,Noto_Color_Emoji:h8
--   let g:neovide_cursor_vfx_mode = "pixiedust"
--   " let g:neovide_scale_factor=0.5
--   let g:neovide_scale_factor=1.0
--   function! ChangeScaleFactor(delta)
--     let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
--   endfunction
--   nnoremap <expr><C-=> ChangeScaleFactor(1.25)
--   nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
-- endif
-- ]])

-- vim.g.terminal_color_0 = "#45475A" -- black
-- vim.g.terminal_color_1 = "#F38BA8" -- dark red
-- vim.g.terminal_color_2 = "#A6E3A1" -- dark green
-- vim.g.terminal_color_3 = "#F9E2AF" -- dark yellow
-- vim.g.terminal_color_4 = "#89B4FA" -- dark blue
-- vim.g.terminal_color_5 = "#F5C2E7" -- dark magenta
-- vim.g.terminal_color_6 = "#94E2D5" -- dark cyan
-- vim.g.terminal_color_7 = "#A6ADC8" -- light gray
-- vim.g.terminal_color_8 = "#BAC2DE" -- dark gray
-- vim.g.terminal_color_9 = "#F38BA8" -- red
-- vim.g.terminal_color_10 = "#A6E3A1" -- green
-- vim.g.terminal_color_11 = "#F9E2AF" -- yellow
-- vim.g.terminal_color_12 = "#89B4FA" -- blue
-- vim.g.terminal_color_13 = "#F5C2E7" -- magenta
-- vim.g.terminal_color_14 = "#94E2D5" -- cyan
-- vim.g.terminal_color_15 = "#BAC2DE" -- white

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

lvim.lsp.diagnostics.virtual_text = false
-- lvim.builtin.terminal.execs = {
--   { vim.o.shell, "<C-\\>", "Horizontal Terminal", "horizontal", 0.3 },
--   { vim.o.shell, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
--   { vim.o.shell, "<M-3>", "Float Terminal", "float", nil },
-- }
-- lvim.builtin.terminal.direction = "horizontal"
-- lvim.builtin.terminal.persist_size = true
-- lvim.builtin.terminal.size = 13

vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})
-- lvim.keys.normal_mode["<Leader>r"] = ":e<CR>"
