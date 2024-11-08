return {
  -- { "karb94/neoscroll.nvim", config = true },
  -----------------------------------------------------------------------------
  -- Lualine ------------------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          icons_enabled = true,
          component_separators = "", -- { left = "", right = "" },
          section_separators = "", -- { left = "", right = "" },
          always_divide_middle = true,
        },
        sections = {
          -- stylua: ignore
          lualine_a = { { function() return " " end, padding = { left = 0, right = 0 } } }, -- { "mode" },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
            {
              function()
                return require("copilot_status").status_string()
              end,
              cnd = function()
                return require("copilot_status").enabled()
              end,
            },
          },
          lualine_c = {
            { "filename", path = 1 },
            {
              function()
                local buf_ft = vim.bo.filetype
                local clients = vim.lsp.get_clients {
                  bufnr = 0,
                } -- Gets active LSP clients for the current buffer
                if next(clients) == nil then
                  return ""
                end

                local buf_client_names = {}

                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes

                  if filetypes and vim.tbl_contains(filetypes, buf_ft) and client.name ~= "null-ls" then
                    table.insert(buf_client_names, client.name)
                  end
                end

                return table.concat(buf_client_names, ", ")
              end,
              icon = " LSP:",
            },
            -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {
          "toggleterm",
          "neo-tree",
          "symbols-outline",
          "lazy",
        },
      }
    end,
  },

  -----------------------------------------------------------------------------
  -- Bufferline ---------------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
    keys = {
      { "<S-l>", "<CMD>BufferLineCycleNext<CR>", desc = "Go to next buffer" },
      { "<S-h>", "<CMD>BufferLineCyclePrev<CR>", desc = "Go to prev buffer" },
      { "<leader>c", "<CMD>:Bdelete<CR>", desc = "Go to prev buffer" },
    },
    opts = {
      options = {
        close_command = "Bdelete! %d",
        max_name_length = 20,
        max_prefix_length = 15,
        tab_size = 22,
        diagnostics = "nvim_lsp",
        separator_style = { "▏", "▕" },
        show_close_icon = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = " ----- File Explorer ----- ",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------
  -- ToggleTerm ---------------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      size = 24,
      shade_level = 5,
      float_opts = {
        border = "curved",
      },
    },
  },

  -----------------------------------------------------------------------------
  -- Neotree ------------------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-tree/nvim-web-devicons",
        opts = {
          override_by_filename = {
            ["tsconfig.json"] = {
              icon = "󰛦",
            },
          },
          override_by_extension = {
            tex = { icon = "" },
            cls = { icon = "" },
            sty = { icon = "" },
          },
        },
      },
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<C-b>", "<CMD>Neotree toggle<CR>", desc = "Toggle NeoTree" },
      { "<C-g>", "<CMD>Neotree focus<CR>", desc = "Focus NeoTree" },
      { "<leader>ft", "<CMD>Neotree float<CR>", desc = "Float NeoTree" },
    },
    deactivate = function()
      vim.cmd "Neotree close"
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.uv.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require "neo-tree"
        end
      end
    end,
    opts = {
      window = {
        width = 32,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        bind_to_cwd = false,
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
          show_hidden_count = false,
          hide_gitignored = false,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
}
