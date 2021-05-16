# My neovim configuration

![image](https://user-images.githubusercontent.com/5762261/109759786-38f6e880-7bb3-11eb-8229-f450fd9c0292.png)

## Note
Historically this repo has been compatible with vim8 and neovim, but if you are
reading this now, the configuration has been ported to lua and compatibility
with vim has been dropped.  The last vim-compatible commit has been tagged vim.

This is a living configuration and is constantly being tweaked, so use at your
own peril.  The included plugins, keymaps, colors and configurations are subject
to change with every commit.

## Requirements

- Neovim >= 0.5

## What plugins am I using?

### Plugin Management

 - github.com/wbthomason/packer.nvim

### Colorscheme

 - github.com/nanotech/jellybeans.vim
 - github.com/cwebster2/color-overrides.nvim

### Status Line

 - github.com/glepnir/galaxyline.nvim

### Tab Bar

 - github.com/romgrk/barbar.nvim

### File Tree

 - github.com/kyazdani42/nvim-tree.lua

### Fuzzy finding

 - github.com/nvim-telescope/telescope.nvim
 - github.com/nvim-telescope/telescope-fzy-native.nvim
 - github.com/nvim-telescope/telescope-fzf-writer.nvim
 - github.com/nvim-telescope/telescope-packer.nvim
 - github.com/nvim-telescope/telescope-github.nvim
 - github.com/nvim-telescope/telescope-symbols.nvim
 - github.com/nvim-telescope/telescope-vimspector.nvim
 - github.com/junegunn/fzf
 - github.com/junegunn/fzf.vim

### Language Server Protocol Things
 - github.com/neovim/nvim-lspconfig
 - github.com/nvim-treesitter/nvim-treesitter
 - github.com/nvim-treesitter/nvim-treesitter-textobjects
 - github.com/p00f/nvim-ts-rainbow
 - github.com/kosayoda/nvim-lightbulb
 - github.com/glepnir/lspsaga.nvim
 - github.com/ray-x/lsp_signature.nvim
 - github.com/folke/lsp-trouble.nvim

### Completion

 - github.com/hrsh7th/nvim-compe
 - github.com/hrsh7th/vim-vsnip
 - github.com/hrsh7th/vim-vsnip-integ

### Symbol Tree

 - github.com/simrat39/symbols-outline.nvim

### Git stuff

 - github.com/tpope/vim-fugitive
 - github.com/airblade/vim-gitgutter
 - github.com/pwntester/octo.nvim
 - github.com/junegunn/gv.vim

### Auto-pairs

 - github.com/tmsvg/pear-tree'

### The rest

 - github.com/RRethy/vim-hexokinase
 - github.com/szw/vim-maximizer
 - github.com/lukas-reineke/indent-blankline.nvim
 - github.com/editorconfig/editorconfig-vim
 - github.com/ntpeters/vim-better-whitespace
 - github.com/terrortylor/nvim-comment
 - github.com/unblevable/quick-scope
 - github.com/kassio/neoterm
 - github.com/janko/vim-test
 - github.com/puremourning/vimspector
 - github.com/plasticboy/vim-markdown
 - github.com/iamcco/markdown-preview.nvim
 - github.com/vim-latex/vim-latex
 - github.com/airblade/vim-rooter
 - github.com/tpope/vim-eunuch
 - github.com/tpope/vim-surround


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
of language servers.  I have a script to install these and it looks like

```bash
install_lsp_servers() {
  echo
  echo "Installing language servers"
  echo
  (
    echo "Fetching the terraform language server"
    TFLSVER=${TFLSVER:-0.12.1}
    TFLSARCH=${TFLSARCH:-amd64}
    curl -fLo "${HOME}"/bin/terraform-ls.zip "https://releases.hashicorp.com/terraform-ls/${TFLSVER}/terraform-ls_${TFLSVER}_linux_${TFLSARCH}.zip"
    unzip "${HOME}"/bin/terraform-ls.zip -d "${HOME}"/bin
    rm "${HOME}"/bin/terraform-ls.zip
    chmod 755 "${HOME}"/bin/terraform-ls

    echo "Fetching the rust analyzer language server"
    rustup component add rust-src
    curl -fLo "${HOME}"/bin/rust-analyzer "https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux"
    chmod 755 "${HOME}"/bin/rust-analyzer

    echo "Building the tex language server"
    cargo install --git https://github.com/latex-lsp/texlab.git --locked

    echo "Installing the python language server"
    pip install --quiet python-language-server

    echo "Installing bash, docker, json, yaml, ts/js, and vimscript language servers"
    npm install --silent -g \
      bash-language-server \
      dockerfile-language-server-nodejs \
      vscode-json-languageserver \
      yaml-language-server \
      typescript-language-server \
      vim-language-server \
      vls

    echo "Installing efm general purpose ls"
    go get github.com/mattn/efm-langserver

    echo "Building the lua language server"
    (
      sudo apt-get -y install ninja-build
      mkdir -p "${HOME}"/src
      cd "${HOME}"/src
      git clone https://github.com/sumneko/lua-language-server
      cd lua-language-server
      git submodule update --init --recursive
      cd 3rd/luamake
      ninja -f ninja/linux.ninja
      cd ../..
      ./3rd/luamake/luamake rebuild
    )

    echo "Installing the go language server"
    (
      set -x
      set +e
      GO111MODULE=on go get golang.org/x/tools/gopls@latest
    )

    echo "Language servers installed"
    cd "${HOME}"
  )
}
```

You can suit this to your needs bet using it as is assumes you have working node, python, golang, and rust environments.
The installer for the lua language server further requires ninja and a working C environment.  The efm language server has
a configuration that relies on `eslint_d` and `prettier` being installed globally.  If you don't have these,

    npm install -g eslint_d prettier


