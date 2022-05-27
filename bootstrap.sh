#!/usr/bin/env bash

cd "$HOME" || exit 1

# update alternatives to vim
if [ -n "$(command -v pip)" ]; then
  pip install --quiet neovim
fi

if [ -n "$(command -v npm)" ]; then
  npm install neovim
fi

# get packer
PACKER_DIRECTORY="${HOME}/.local/share/nvim/site/pack/packer/opt/packer.nvim"

if ! [ -d "$PACKER_DIRECTORY" ]; then
  git clone "https://github.com/wbthomason/packer.nvim" "$PACKER_DIRECTORY"
fi

# sync plugins
"${HOME}"/.local/bin/nvim -u NONE --headless \
  +'autocmd User PackerComplete quitall' \
  +'lua require("cwebster.plugins")' \
  +'lua require("packer").sync()'

# install external tools
"${HOME}"/.config/nvim/lspinstall.sh all
"${HOME}"/.config/nvim/dapinstall.sh all
