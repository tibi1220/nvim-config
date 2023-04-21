return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    -- stylua: ignore
    keys = {
      { "<leader>dd", function() require("gitsigns").diffthis() end, "Git diff" },
    },
    opts = {
      numhl = true,
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = "▎", -- ▎
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = "▎", -- ▎
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
          text = "▎", -- ▎
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
    },
  },
  {
    "f-person/git-blame.nvim",
  },
}
