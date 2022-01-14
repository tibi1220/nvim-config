local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

-- gitsigns.setup {
--   signs = {
--     add          = {hl = 'diffAdded', text = '┃'},
--     change       = {hl = 'diffRemoved', text = '┃'},
--     delete       = {hl = 'diffRemoved', text = '_'},
--     topdelete    = {hl = 'diffRemoved', text = '‾'},
--     changedelete = {hl = 'diffRemoved', text = '~'},
--   },
-- }

gitsigns.setup {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "+", -- ▎
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "~", -- ▎
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "_", -- 契
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "‾", -- 契
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "~", -- ▎
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
}
