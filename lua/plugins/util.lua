return {
  -----------------------------------------------------------------------------
  -- Session Manager ----------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -----------------------------------------------------------------------------
  -- Word Illumination --------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 50,
    },
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
      --
      --   local function map(key, dir, buffer)
      --     vim.keymap.set("n", key, function()
      --       require("illuminate")["goto_" .. dir .. "_reference"](false)
      --     end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      --   end
      --
      --   map("]]", "next")
      --   map("[[", "prev")
      --
      --   -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      --   vim.api.nvim_create_autocmd("FileType", {
      --     callback = function()
      --       local buffer = vim.api.nvim_get_current_buf()
      --       map("]]", "next", buffer)
      --       map("[[", "prev", buffer)
      --     end,
      --   })
    end,
  },
}
