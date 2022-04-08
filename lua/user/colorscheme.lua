vim.o.termguicolors = true

vim.g.gruvbox_italic_keyword = true
vim.g.gruvbox_italic_boolean = true
vim.g.gruvbox_italic_variable = true

vim.g.gruvbox_bold = true

--[[ vim.g.gruvbox_style = "hard" ]]

vim.cmd [[
  try
    colorscheme gruvbox
    " colorscheme darkplus
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
