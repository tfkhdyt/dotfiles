local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
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

  -- go
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,
  b.formatting.goimports_reviser,
  b.formatting.golines,

  -- code_actions
  b.code_actions.refactoring,

  -- php
  b.diagnostics.php,
  b.formatting.phpcsfixer,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
