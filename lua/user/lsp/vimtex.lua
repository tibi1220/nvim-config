-- vim.notify "Hali"
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_ignore_filters = {
  "Underfull",
  "Overfull",
  "tocbibind",
}
-- vim.g.vimtex_compiler_latexmk = {
--   build_dir = "build",
--   options = {
--     "-lualatex",
--     "--shell-escape",
--     "-verbose",
--     "-file-line-error",
--     "-synctex=1",
--     "-interaction=nonstopmode",
--   },
-- }
