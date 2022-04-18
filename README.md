# My neovim configuration

![image](https://raw.githubusercontent.com/cwebster2/vim/nvim-lua/.images/screenshot.png)

## Note
Historically this configuration has been compatible with vim8 and neovim, but if you are
reading this now, the configuration has been ported to lua and compatibility
with vim has been dropped.  The last vim-compatible commit has been tagged `vim`.

This is a living configuration and is constantly being tweaked, so use at your
own peril.  The included plugins, keymaps, colors and configurations are subject
to change with every commit.

## Requirements

- Neovim >= 0.7

## What plugins am I using?
<!-- PLUGIN_START -->

<!-- PLUGIN_END -->

## Using this configuration

Clone this repo to `~/.config/nvim` e.g.

    git clone git@github.com:cwebster2/vim --depth 1 ~/.config/nvim

The first time you run neovim with this config it will install the packer plugin
automatically.  You may see errors the first time you run nvim but this is ok and
just a byproduct of plugins not being installed yet.
You will need to run the PackerSync command to download and install
all the configured plugins.

    <esc>:PackerSync<CR>

Exit and re-enter nvim to make sure everything is initialized properly.

This configuration makes use of the builtin nvim lsp client and configures a number
of language servers.  I have a script to install these and you can call it to install everything as:

```bash
./lspinstall.sh all
```

You can suit this to your needs but to install everything you will need working node, python, golang, and rust environments.
The installer for the lua language server further requires ninja and a working C environment.


