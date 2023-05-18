# My neovim configuration

This repo contains my current
[`neovim`](https://github.com/neovim/neovim)
configuration files. The setup is powered by
[`lazy.nvim`](https://github.com/folke/lazy.nvim)
.

## Requirements

- `neovim` >= **0.8.0** (needs to be built with **LuaJIT**)
- `git` >= **2.19.0** (for partial clones support)
- a [`Nerd Font`](https://www.nerdfonts.com/)

## Installation

After installing neovim, use the following code to install the configuration:

```shellscript
mv  ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/tibi1220/nvim-config ~/.config/nvim
```

## File structure

## Thanks

```
├── lua
│   ├── config                         // Non plugin related stuff
│   │   ├── autocmds.lua
│   │   ├── icons.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   ├── plugins                        // Plugin related stuff
│   │   ├── lsp
│   │   │   ├── format.lua
│   │   │   ├── init.lua
│   │   │   ├── keymaps.lua
│   │   │   └── servers.lua
│   │   ├── coding.lua
│   │   ├── colorscheme.lua
│   │   ├── editor.lua
│   │   ├── git.lua
│   │   ├── language-specific.lua
│   │   ├── ui.lua
│   │   └── util.lua
│   └── utils                          // Helper functions
│       └── init.lua
└── init.lua                           // Main entry point
```

I want to say thank you to all the plugin authors and to the entire neovim
community. While making my config my main inspiration was:

- [LazyVim](https://github.com/LazyVim/LazyVim)
