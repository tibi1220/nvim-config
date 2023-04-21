-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd "colorscheme kanagawa"
--   end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd "colorscheme tokyonight"
--   end,
-- }

-- return {
--   "morhetz/gruvbox",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd "colorscheme gruvbox"
--   end,
-- }

return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme nightfox"
  end,
}

-- return {
--   "catppuccin/nvim",
--   as = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = "frappe",
--     show_end_of_buffer = true,
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd "colorscheme catppuccin-frappe"
--     vim.o.background = "dark"
--   end,
-- }
