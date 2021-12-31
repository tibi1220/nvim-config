# My current neovim configuration files

## Neovim installation

### MacOS installation

```
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-osx64/bin/nvim
```

Or install with [Homebrew](brew.sh):

```
brew install nvim
```

### Other operating systems

Check nvim [documentation](https://github.com/neovim/neovim/wiki/Installing-Neovim).

## Clone repo

```
mv  ~/.config/nvim ~/.config/nvim-old
git clone https://github.com/tibi1220/nvim-config ~/.config/nvim
```

## Setup

### Opening neovim

Run `nvim` in the terminal.

```
nvim
```

### configuration

Run the following command to install plugins:

```
:PackerSync
```
