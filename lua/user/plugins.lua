local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Utils
  use "nvim-lua/plenary.nvim"                   -- Lua prewritten functions
  use "lewis6991/impatient.nvim"                -- Faster init.lua loadtimes
  use "antoinemadec/FixCursorHold.nvim"         -- Fix Cursorhold performance
  use "kevinhwang91/nvim-bqf"                   -- Quickfix menu fix
  use "kyazdani42/nvim-web-devicons"            -- Icons plugin

  -- General plugins
  use "wbthomason/packer.nvim"                  -- Packer plugin manager

  use "kyazdani42/nvim-tree.lua"                -- Nerdtree in lua
  use "akinsho/bufferline.nvim"                 -- Use multiple tabs
  use "nvim-lualine/lualine.nvim"               -- Airline like

  use "moll/vim-bbye"                           -- Delete buffer without exiting vim
  use "Shatur/neovim-session-manager"           -- Save vim sessions
  use "tversteeg/registers.nvim"                -- Access registers

  use "folke/todo-comments.nvim"                -- TODO comments support
  use "numToStr/Comment.nvim"                   -- Plugin for comments

  use "akinsho/toggleterm.nvim"                 -- XXX Toggle terminal from vim
  use "lukas-reineke/indent-blankline.nvim"     -- Guidelines for indentations
  use "goolord/alpha-nvim"                      -- Customize vim greeting
  use "folke/which-key.nvim"                    -- Shortcut cheetsheat
  use "nacro90/numb.nvim"                       -- Peek lines by entering :{Number}
  use "norcalli/nvim-colorizer.lua"             -- Colorize hex/func/names
  use "windwp/nvim-spectre"                     -- Regex search - deps: Plenary
  use "folke/zen-mode.nvim"                     -- Zen mode
  use "karb94/neoscroll.nvim"                   -- Smooth scrolling
  use "rcarriga/nvim-notify"                    -- Notification manager

  -- Language specific
  use {                                         -- Markdown preview
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Colorschemes
  use "lunarvim/darkplus.nvim"                  -- VS Code like theme
  use "morhetz/gruvbox"                         -- Gruvbox

  -- LSP
  use "neovim/nvim-lspconfig"                  -- Enable Language Server Protocol
  use "williamboman/nvim-lsp-installer"        -- LSP server installer
  use "jose-elias-alvarez/null-ls.nvim"        -- Formatting
  use "jose-elias-alvarez/nvim-lsp-ts-utils"   -- TS utils for lsp
  use "tamago324/nlsp-settings.nvim"           -- language server settings defined in json for
  use 'ray-x/lsp_signature.nvim'               -- Popup help
  use "filipdutescu/renamer.nvim"              -- Rename variables <F2>
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"
  use "lervag/vimtex"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
    -- TODO: configure LSP

  -- Cmp plugins
  use "hrsh7th/nvim-cmp"                        -- The completion plugin
  use "hrsh7th/cmp-buffer"                      -- buffer completions
  use "hrsh7th/cmp-path"                        -- path completions
  use "hrsh7th/cmp-cmdline"                     -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"                -- snippet completions

  -- Snippets
  use "L3MON4D3/LuaSnip"                        -- snippet engine
  use "rafamadriz/friendly-snippets"            -- a bunch of snippets to use

  -- Telescope
  use "nvim-telescope/telescope.nvim"                 -- Fuzzy finder
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"       -- Bookmarks
  use "nvim-telescope/telescope-media-files.nvim"     -- Telescope media viewer
  use "ahmedkhalf/project.nvim"                       -- Project manager for telescope integration

  -- Treesitter
  use {                                               -- Better highlighting
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"   -- TSX commenting fix
  use "ChristianChiarulli/nvim-ts-rainbow"            -- Bracket pair colorizer
  use "nvim-treesitter/playground"                    -- Treesitter playground
  use "windwp/nvim-autopairs"                         -- Autopair plugin
  use "windwp/nvim-ts-autotag"                        -- Auto rename HTML tag
  use 'romgrk/nvim-treesitter-context'                -- Lightweight context viewer
  use 'mizlan/iswap.nvim'                             -- Function parameter swapper

  -- Git
  use "lewis6991/gitsigns.nvim"                 -- Git per line integration
  use "f-person/git-blame.nvim"                 -- Git blame per line integration
  use "mattn/webapi-vim"                        -- Web api interface

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
