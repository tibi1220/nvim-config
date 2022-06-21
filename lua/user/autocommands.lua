vim.cmd [[
  augroup format_on_save
    autocmd! 
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
  augroup end

  autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=hu,en_us
]]

-- vim.notify "Formatting on Save is enabled by default! Type <CMD>ToggleAutoFormat to disable"
