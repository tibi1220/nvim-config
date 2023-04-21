return {
  -----------------------------------------------------------------------------
  -- TeX ----------------------------------------------------------------------
  -----------------------------------------------------------------------------
  {
    "lervag/vimtex",
    ft = "tex",
    -- enabled = false,
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_syntax_enabled = false -- Fucks up lua code

      vim.cmd [[
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=hu,en_us,ru

function! s:write_server_name() abort
let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
call writefile([v:servername], nvim_server_file)
endfunction

augroup vimtex_common
  autocmd!
  autocmd FileType tex call s:write_server_name()
augroup END
      ]]

      -- A not so elegant way to remove this mapping
      vim.cmd "autocmd FileType tex iunmap <buffer> ]]"
    end,
    -- Skim command
    -- nvr --servername `cat /tmp/vimtexserver.txt` +"%line" "%file"
  },
}
