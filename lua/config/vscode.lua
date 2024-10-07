-- This is purely for VSCode keybindings
local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Navigate tab completion
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')
