require "user.options"

require "user.keymaps"
require "user.colorscheme"
require "user.autocommands"

require "user.plugins"

require "user.lsp"

require "user.plugins.bufferline"
require "user.plugins.alpha"
require "user.plugins.cmp"
require "user.plugins.Comment"
require "user.plugins.gitsigns"
require "user.plugins.indent-blankline"
require "user.plugins.lualine"
--[[ require "user.plugins.neovim-session-manager" ]]
require "user.plugins.numb"
require "user.plugins.nvim-autopairs"
require "user.plugins.nvim-colorizer"
require "user.plugins.nvim-telescope"
require "user.plugins.nvim-tree"
require "user.plugins.nvim-treesitter"
require "user.plugins.which-key"

vim.cmd [[ set cc=80,100,120 ]]
