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

- Neovim 0.8

## What plugins am I using?

### Core
 - [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
 - [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)
 - [nathom/filetype.nvim](https://github.com/nathom/filetype.nvim)
 - [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim)

### Common
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)

### Startup
 - [mhinz/vim-startify](https://github.com/mhinz/vim-startify)

### Finders and pickers
 - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
 - [nvim-telescope/telescope-packer.nvim](https://github.com/nvim-telescope/telescope-packer.nvim)
 - [nvim-telescope/telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim)
 - [nvim-telescope/telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
 - [nvim-telescope/telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim)
 - [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
 - [cwebster2/github-coauthors.nvim](https://github.com/cwebster2/github-coauthors.nvim)
 - [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

### Syntax
 - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - [nvim-treesitter/playground](https://github.com/nvim-treesitter/playground)
 - [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
 - [nvim-treesitter/nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
 - [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
 - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

### LSP
 - [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
 - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
 - [folke/lua-dev.nvim](https://github.com/folke/lua-dev.nvim)
 - [nvim-lua/lsp-status.nvim](https://github.com/nvim-lua/lsp-status.nvim)
 - [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
 - [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
 - [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)

### diagnostics
 - [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
 - [folke/lsp-trouble.nvim](https://github.com/folke/lsp-trouble.nvim)
 - [https://git.sr.ht/~whynothugo/lsp_lines.nvim](https://git.sr.ht/~whynothugo/lsp_lines.nvim)

### Completion
 - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
 - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
 - [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
 - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
 - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
 - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
 - [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
 - [hrsh7th/cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
 - [hrsh7th/cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol)
 - [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
 - [Saecki/crates.nvim](https://github.com/Saecki/crates.nvim)
 - [f3fora/cmp-spell](https://github.com/f3fora/cmp-spell)
 - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Colorschemes
 - [catppuccin/nvim](https://github.com/catppuccin/nvim)

### UI
 - [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
 - [rebelot/heirline.nvim](https://github.com/rebelot/heirline.nvim)
 - [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
 - [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
 - [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
 - [szw/vim-maximizer](https://github.com/szw/vim-maximizer)
 - [SmiteshP/nvim-gps](https://github.com/SmiteshP/nvim-gps)
 - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - [anuvyklack/hydra.nvim](https://github.com/anuvyklack/hydra.nvim)
 - [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

### language stuff
 - [TimUntersberger/neogit](https://github.com/TimUntersberger/neogit)
 - [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
 - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
 - [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
 - [NTBBloodbath/rest.nvim](https://github.com/NTBBloodbath/rest.nvim)
 - [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
 - [ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)

### ide features
 - [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
 - [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
 - [unblevable/quick-scope](https://github.com/unblevable/quick-scope)
 - [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
 - [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
 - [pwntester/octo.nvim](https://github.com/pwntester/octo.nvim)
 - [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
 - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
 - [akinsho/nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)
 - [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)
 - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
 - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim)
 - [haydenmeade/neotest-jest](https://github.com/haydenmeade/neotest-jest)
 - [cwebster2/mocha-runner.nvim](https://github.com/cwebster2/mocha-runner.nvim)
 - [ThePrimeagen/refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
 - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
 - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - [metakirby5/codi.vim](https://github.com/metakirby5/codi.vim)
 - [junegunn/gv.vim](https://github.com/junegunn/gv.vim)
 - [uga-rosa/ccc.nvim](https://github.com/uga-rosa/ccc.nvim)

### copilot
 - [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
 - [zbirenbaum/copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)

### Testing
 - [janko/vim-test](https://github.com/janko/vim-test)

### Debugging
 - [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
 - [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
 - [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

### Markdown
 - [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
 - [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

### LaTeX
 - [vim-latex/vim-latex](https://github.com/vim-latex/vim-latex)

### The Rest
 - [airblade/vim-rooter](https://github.com/airblade/vim-rooter)
 - [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch)
 - [andweeb/presence.nvim](https://github.com/andweeb/presence.nvim)
 - [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)

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
of language servers. Installation of configured servers should happen automatically. 


