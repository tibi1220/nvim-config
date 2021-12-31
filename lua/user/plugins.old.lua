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
  -- General plugins
  use "wbthomason/packer.nvim"                  -- Packer plugin manager
  use "nvim-lua/popup.nvim"                     -- Vim-like popup api
  use "nvim-lua/plenary.nvim"                   -- Lua prewritten functions
  use "windwp/nvim-autopairs"                   -- Autopair plugin?
  use "numToStr/Comment.nvim"                   -- Plugin for comments
  use "kyazdani42/nvim-web-devicons"            -- Icons plugin
  use "kyazdani42/nvim-tree.lua"                -- Nerdtree in lua
  use "akinsho/bufferline.nvim"                 -- Use multiple tabs
  use "moll/vim-bbye"                           -- Delete buffer without exiting vim
  use "nvim-lualine/lualine.nvim"               -- Airline like
  use "akinsho/toggleterm.nvim"                 -- Toggle terminal from vim
  use "ahmedkhalf/project.nvim"                 -- Project manager for telescope integration
  use "lewis6991/impatient.nvim"                -- Faster init.lua loadtimes
  use "lukas-reineke/indent-blankline.nvim"     -- Guidelines for indentations
  use "goolord/alpha-nvim"                      -- Customize vim greeting
  use "antoinemadec/FixCursorHold.nvim"         -- Fix Cursorhold performance
  use "folke/which-key.nvim"                    -- Shortcut cheetsheat
  use "unblevable/quick-scope"                  -- Show first apperance of each char
  use "phaazon/hop.nvim"                        -- Navigate between blocks easier
  use "andymass/vim-matchup"                    -- Jump between matching words
  use "nacro90/numb.nvim"                       -- Peek lines by entering :{Number}
  use "monaqa/dial.nvim"                        -- Increment/Decrement data (experimental)
  use "norcalli/nvim-colorizer.lua"             -- Colorize hex/func/names
  use "windwp/nvim-spectre"                     -- Regex search - deps: Plenary
  use "folke/zen-mode.nvim"                     -- Zen mode
  use "karb94/neoscroll.nvim"                   -- Smooth scrolling
  use "folke/todo-comments.nvim"                -- TODO comments support
  use "kevinhwang91/nvim-bqf"                   -- Quickfix menu fix
  use "ThePrimeagen/harpoon"                    -- Quick navigation
  use "MattesGroeger/vim-bookmarks"             -- Add bookmarks to files
  use "lunarvim/vim-solidity"                   -- Syntax highlight for solidity
  use "blackCauldron7/surround.nvim"            -- Surrounding
  use "Shatur/neovim-session-manager"           -- Save vim sessions
  use "rcarriga/nvim-notify"                    -- Notification manager
  use "tversteeg/registers.nvim"                -- Access registers
  use 'metakirby5/codi.vim'                     -- Python scratchpad
  use {                                         -- Markdown preview
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes"
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"

  -- Cmp plugins
  use "hrsh7th/nvim-cmp"                        -- The completion plugin
  use "hrsh7th/cmp-buffer"                      -- buffer completions
  use "hrsh7th/cmp-path"                        -- path completions
  use "hrsh7th/cmp-cmdline"                     -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  -- use 'David-Kunz/cmp-npm'                      -- doesn't seem to work

  -- Snippets
  use "L3MON4D3/LuaSnip"                        -- snippet engine
  use "rafamadriz/friendly-snippets"            -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"                   -- Enable Language Server Protocol
  use "williamboman/nvim-lsp-installer"         -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"            -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim"         -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use 'ray-x/lsp_signature.nvim'
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }

  -- Java
  use "mfussenegger/nvim-jdtls"                 -- LSP support for exlipse.jdt.ls

  -- Telescope
  use "nvim-telescope/telescope.nvim"                 -- Fuzzy finder
  use "tom-anders/telescope-vim-bookmarks.nvim"       -- Bookmarks
  use "nvim-telescope/telescope-media-files.nvim"     -- Telescope media viewer

  -- Treesitter
  use {                                               -- Better highlighting
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"   -- TSX commenting fix
  use "ChristianChiarulli/nvim-ts-rainbow"            -- Bracket pair colorizer
  use "nvim-treesitter/playground"                    -- Treesitter playground
  use "windwp/nvim-ts-autotag"                        -- Auto rename HTML tag
  use 'romgrk/nvim-treesitter-context'                -- Lightweight context viewer
  use 'mizlan/iswap.nvim'                             -- Function parameter swapper

  -- Git
  use "lewis6991/gitsigns.nvim"                 -- Git per line integration
  use "f-person/git-blame.nvim"                 -- Git blame per line integration
  use "ruifm/gitlinker.nvim"                    -- Create git permalinks
  use "mattn/vim-gist"                          -- Create gists
  use "mattn/webapi-vim"                        -- Web api interface

  -- DAP
  use "mfussenegger/nvim-dap"                   -- Debug Adapter Protocol
  use "theHamsta/nvim-dap-virtual-text"         -- Virtual text for DAP - deps: Treesitter
  use "rcarriga/nvim-dap-ui"                    -- DAP UI
  use "Pocco81/DAPInstall.nvim"                 -- Manage debuggers

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
