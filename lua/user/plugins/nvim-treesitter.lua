local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "tex", "latex" },
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
    disable = { "tex", "latex" },
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
  },
  playground = {
    enable = true,
  },
}
