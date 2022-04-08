local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  -- open_mapping = [[<C-`>]],
  open_mapping = [[<C-\>]],
  direction = "horizontal",
  size = 16,
  shade_level = 5,
  float_opts = {
    border = "curved",
  },
}

local Terminal = require("toggleterm.terminal").Terminal
local opts = { noremap = true, silent = true }
local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local lazygit = Terminal:new {
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
}
local node = Terminal:new { cmd = "node", direction = "float" }
local python = Terminal:new { cmd = "python", direction = "float" }
local ncdu = Terminal:new { cmd = "ncdu", direction = "float" }
local htop = Terminal:new { cmd = "htop", direction = "float" }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
function _NODE_TOGGLE()
  node:toggle()
end
function _PYTHON_TOGGLE()
  python:toggle()
end
function _HTOP_TOGGLE()
  htop:toggle()
end
function _NCDU_TOGGLE()
  ncdu:toggle()
end

map("n", "<LEADER>g", "<CMD>lua _LAZYGIT_TOGGLE()<CR>")
map("n", "<C-/>", "<CMD>ToggleTermToggleAll<CR>")
