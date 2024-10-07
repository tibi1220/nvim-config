return {
  clangd = {
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "tex", "jit", "bit", "bit32" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
      },
    },
  },
  emmet_ls = {
    init_options = {
      html = {
        options = {
          ["output.selfClosingStyle"] = "xhtml",
          -- ["jsx.enabled"] = true,
        },
      },
      jsx = {
        options = {
          ["output.selfClosingStyle"] = "xhtml",
        },
      },
    },
  },
}
