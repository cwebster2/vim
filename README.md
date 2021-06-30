# My neovim configuration

![image](https://user-images.githubusercontent.com/5762261/109759786-38f6e880-7bb3-11eb-8229-f450fd9c0292.png)

## Note
Historically this configuration has been compatible with vim8 and neovim, but if you are
reading this now, the configuration has been ported to lua and compatibility
with vim has been dropped.  The last vim-compatible commit has been tagged `vim`.

This is a living configuration and is constantly being tweaked, so use at your
own peril.  The included plugins, keymaps, colors and configurations are subject
to change with every commit.

## Requirements

- Neovim >= 0.5

## What plugins am I using?

### Plugin Management

 - https://github.com/wbthomason/packer.nvim

### Colorscheme

 - https://github.com/nanotech/jellybeans.vim
 - https://github.com/cwebster2/color-overrides.nvim

### Status Line

 - https://github.com/glepnir/galaxyline.nvim

### Tab Bar

 - https://github.com/akinsho/nvim-bufferline.lua

### File Tree

 - https://github.com/kyazdani42/nvim-tree.lua

### Fuzzy finding

 - https://github.com/nvim-telescope/telescope.nvim
 - https://github.com/nvim-telescope/telescope-fzy-native.nvim
 - https://github.com/nvim-telescope/telescope-fzf-writer.nvim
 - https://github.com/nvim-telescope/telescope-packer.nvim
 - https://github.com/nvim-telescope/telescope-github.nvim
 - https://github.com/nvim-telescope/telescope-symbols.nvim
 - https://github.com/nvim-telescope/telescope-vimspector.nvim
 - https://github.com/junegunn/fzf
 - https://github.com/junegunn/fzf.vim

### Syntax
 - https://github.com/nvim-treesitter/nvim-treesitter
 - https://github.com/nvim-treesitter/nvim-treesitter-textobjects
 - https://github.com/nvim-treesitter/nvim-treesitter-refactor
 - https://github.com/nvim-treesitter/nvim-treesitter-context
 - https://github.com/p00f/nvim-ts-rainbow
 - https://github.com/sheerun/vim-polyglot

### Language Server Protocol Things
 - https://github.com/neovim/nvim-lspconfig
 - https://github.com/kosayoda/nvim-lightbulb
 - https://github.com/glepnir/lspsaga.nvim
 - https://github.com/ray-x/lsp_signature.nvim
 - https://github.com/folke/lsp-trouble.nvim

### Completion

 - https://github.com/hrsh7th/nvim-compe
 - https://github.com/hrsh7th/vim-vsnip
 - https://github.com/hrsh7th/vim-vsnip-integ

### Symbol Tree

 - https://github.com/simrat39/symbols-outline.nvim

### Git stuff

 - https://github.com/TimUntersberger/neogit
 - https://github.com/lewis6991/gitsigns.nvim
 - https://github.com/pwntester/octo.nvim
 - https://github.com/junegunn/gv.vim
 - https://github.com/cwebster2/github-coauthors.nvim

### Auto-pairs

 - https://github.com/tmsvg/pear-tree

### Keymap management

 - https://github.com/folke/which-key.nvim

### Visual aids

 - https://github.com/lukas-reineke/indent-blankline.nvim
 - https://github.com/ntpeters/vim-better-whitespace
 - https://github.com/unblevable/quick-scope
 - https://github.com/RRethy/vim-hexokinase
 - https://github.com/szw/vim-maximizer

### The rest

 - https://github.com/editorconfig/editorconfig-vim
 - https://github.com/terrortylor/nvim-comment
 - https://github.com/kassio/neoterm
 - https://github.com/janko/vim-test
 - https://github.com/puremourning/vimspector
 - https://github.com/plasticboy/vim-markdown
 - https://github.com/iamcco/markdown-preview.nvim
 - https://github.com/vim-latex/vim-latex
 - https://github.com/airblade/vim-rooter
 - https://github.com/tpope/vim-eunuch
 - https://github.com/tpope/vim-surround


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


