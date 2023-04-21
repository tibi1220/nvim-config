local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--------------------------------------------------------------------------------
------------------------------- INSERT MODE ------------------------------------
--------------------------------------------------------------------------------
-- Exit insert mode by pressing jk
map("i", "jk", "<ESC>")

--------------------------------------------------------------------------------
------------------------------- VISUAL MODE ------------------------------------
--------------------------------------------------------------------------------
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Toggle options
map("n", "<leader>tf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })

--------------------------------------------------------------------------------
------------------------------- COMMAND MODE -----------------------------------
--------------------------------------------------------------------------------
-- Navigate tab completion
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

--------------------------------------------------------------------------------
------------------------------- TERM MODE --------------------------------------
--------------------------------------------------------------------------------
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
