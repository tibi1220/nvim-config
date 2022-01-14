-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end

require "user.lsp.lsp-signature"
require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.renamer"
require "user.lsp.symbols-outline"
require "user.lsp.vimtex"

