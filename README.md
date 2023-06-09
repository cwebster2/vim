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

- Neovim 0.10 (nightly)

## What plugins am I using?

### Core

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)

### Common

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)

### Startup

- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)

### Finders and pickers

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-telescope/telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim)
- [nvim-telescope/telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim)
- [nvim-telescope/telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
- [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [cwebster2/github-coauthors.nvim](https://github.com/cwebster2/github-coauthors.nvim)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

### Syntax

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-treesitter/nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/playground](https://github.com/nvim-treesitter/playground)
- [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

### LSP

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig](https://github.com/williamboman/mason-lspconfig)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)

### diagnostics

- [folke/lsp-trouble.nvim](https://github.com/folke/lsp-trouble.nvim)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [whynothugo/lsp_lines.nvim](https://git.sr.ht/~whynothugo/lsp_lines.nvim)

### Completion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Saecki/crates.nvim](https://github.com/Saecki/crates.nvim)
- [f3fora/cmp-spell](https://github.com/f3fora/cmp-spell)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [petertriho/cmp-git](https://github.com/petertriho/cmp-git)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

### Colorschemes

- [catppuccin/nvim](https://github.com/catppuccin/nvim)

### UI

- [Bekaboo/dropbar](https://github.com/Bekaboo/dropbar.nvim)
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [anuvyklack/hydra.nvim](https://github.com/anuvyklack/hydra.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [rebelot/heirline.nvim](https://github.com/rebelot/heirline.nvim)
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [szw/vim-maximizer](https://github.com/szw/vim-maximizer)

### language stuff

- [NTBBloodbath/rest.nvim](https://github.com/NTBBloodbath/rest.nvim)
- [TimUntersberger/neogit](https://github.com/TimUntersberger/neogit)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
- [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)

### ide features

- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [ThePrimeagen/refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
- [akinsho/nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)
- [almo7aya/openingh.nvim](https://github.com/almo7aya/openingh.nvim)
- [cwebster2/mocha-runner.nvim](https://github.com/cwebster2/mocha-runner.nvim)
- [haydenmeade/neotest-jest](https://github.com/haydenmeade/neotest-jest)
- [junegunn/gv.vim](https://github.com/junegunn/gv.vim)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [metakirby5/codi.vim](https://github.com/metakirby5/codi.vim)
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)
- [pwntester/octo.nvim](https://github.com/pwntester/octo.nvim)
- [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
- [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
- [uga-rosa/ccc.nvim](https://github.com/uga-rosa/ccc.nvim)
- [unblevable/quick-scope](https://github.com/unblevable/quick-scope)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

### copilot

- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [zbirenbaum/copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)

### Testing

- [janko/vim-test](https://github.com/janko/vim-test)

### Debugging

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

### Markdown

- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

### LaTeX

- [vim-latex/vim-latex](https://github.com/vim-latex/vim-latex)

### The Rest

- [airblade/vim-rooter](https://github.com/airblade/vim-rooter)
- [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch)
- [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)

## Using this configuration

Clone this repo to `~/.config/nvim` e.g.

```bash
    git clone git@github.com:cwebster2/vim --depth 1 ~/.config/nvim
```

This configuration makes use of the builtin nvim lsp client and configures a number
of language servers. Installation of configured servers should happen automatically.
