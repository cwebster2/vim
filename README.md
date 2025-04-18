# My neovim configuration

![image](https://raw.githubusercontent.com/cwebster2/vim/nvim-lua/.images/screenshot.png)

## Note

Historically this configuration has been compatible with vim8 and neovim, but if you are
reading this now, the configuration has been ported to lua and compatibility
with vim has been dropped. The last vim-compatible commit has been tagged `vim`.

This is a living configuration and is constantly being tweaked, so use at your
own peril. The included plugins, keymaps, colors and configurations are subject
to change with every commit.

## Requirements

- Neovim 0.11

## What plugins am I using?

## Using this configuration

Clone this repo to `~/.config/nvim` e.g.

```bash
    git clone git@github.com:cwebster2/vim --depth 1 ~/.config/nvim
```

This configuration makes use of the builtin nvim lsp client and configures a number
of language servers. Installation of configured servers should happen automatically.
