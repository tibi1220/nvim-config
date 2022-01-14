-- Shorten function name
local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------
------------------------------- NORMAL MODE ------------------------------------
--------------------------------------------------------------------------------
map("n", "<C-b>", "<CMD>NvimTreeToggle<CR>")
map(
  "n",
  "<C-p>",
  "<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>"
)
map("n", "<C-s>", "<CMD>vsplit<CR>")
map("n", "<C-z>", "<CMD>ZenMode<CR>")

map("n", "<Leader>B", ":BufferLinePick<CR>")
map("n", "<Leader>C", ":BufferLinePickClose<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "É", "<CMD>w<CR>")
map("n", "é", "<CMD>w<CR>")

--[[ map("n", "<Leader>ld", ":execute open_latex_docs expand('<cWORD>')<CR>") ]]

--------------------------------------------------------------------------------
------------------------------- INSERT MODE ------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
------------------------------- VISUAL MODE ------------------------------------
--------------------------------------------------------------------------------
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- map("v", "<Leader>'", "c''<ESC>hp")
-- map("v", "<Leader>'", "c''<ESC>hp")
-- map("v", '<Leader>(', 'c()<ESC>hp')
-- map("v", '<Leader>[', 'c[]<ESC>hp')
-- map("v", '<Leader>{', 'c{}<ESC>hp')

map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
