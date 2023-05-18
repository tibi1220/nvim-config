return {
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
}
