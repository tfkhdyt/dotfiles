-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.

local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettier,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- eslint
   b.code_actions.eslint,
   b.diagnostics.eslint,
   b.diagnostics.tsc,
   b.formatting.eslint,
   b.formatting.prettier,

   -- go
   b.diagnostics.golangci_lint,
   b.formatting.gofmt,
   b.formatting.goimports,
   b.code_actions.refactoring
}

null_ls.setup {
   debug = true,
   sources = sources,
}

-- load it after nvim-lspconfig cuz we lazy loaded lspconfig
