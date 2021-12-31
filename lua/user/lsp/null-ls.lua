local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local webfiles = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
  "css",
  "scss",
  "less",
  "html",
  "json",
  "yaml",
  "markdown",
  "graphql",
  "solidity",
}

null_ls.setup {
  debug = false,
  sources = {
    -- null_ls.builtins.diagnostics.eslint.with {
    --   filetypes = webfiles,
    -- },
    -- null_ls.builtins.code_actions.eslint.with {
    --   filetypes = webfiles,
    -- },
    null_ls.builtins.formatting.prettier.with {
      filetypes = webfiles,
    },
    null_ls.builtins.formatting.black.with { extra_args = { "--fast" } },
    null_ls.builtins.formatting.stylua,
  },
}
