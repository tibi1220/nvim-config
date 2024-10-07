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
    vim.cmd "hi EndOfBuffer guifg=#738091 guibg=NONE"
  end,
}

-- return {
--   dir = "/Users/tiborsandor/Documents/Code/NVIM/reactive.nvim",
--   config = function()
--     require("reactive").setup {
--       -- debug = true,
--     }
--     vim.cmd [[colorscheme reactive]]
--   end,
-- }

-- return {
--   dir = "/Users/tiborsandor/Documents/Code/NVIM/ninja.nvim",
--   config = function()
--     require("ninja").setup {
--       debug = true,
--     }
--     vim.cmd [[colorscheme ninja]]
--   end,
-- }

-- return {
--   dir = "/Users/tiborsandor/Documents/Code/NVIM/nightfox.nvim",
--   config = function()
--     vim.cmd "colorscheme nightfox"
--   end,
-- }

-- return {
--   {
--     "rktjmp/lush.nvim",
--     priority = 2000,
--   },
--   {
--     dir = "/Users/tiborsandor/Documents/Code/NVIM/reactive",
--     lazy = false,
--     priority = 1000,
--     setup = function()
--       vim.cmd "colorscheme reactive"
--     end,
--   },
-- }

-- return {
--   "bluz71/vim-nightfly-colors",
--   name = "nightfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd "colorscheme nightfly"
--   end,
-- }

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
