#!/usr/bin/env bash
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux; mcode=linux;;
    Darwin*)    machine=Mac; mcode=darwin;;
    *)          machine="UNKNOWN:${unameOut}"
esac

install_lsp_servers_npm() {

  if [[ ! -x $(command -v npm) ]]; then
    echo "npm not found, not skipping npm based lsp servers"
    return
  fi

  echo
  echo "Installing bash, docker, json, yaml, ts/js, and vimscript language servers"
  echo
  (
    npm install --silent -g \
      vscode-langservers-extracted \
      bash-language-server \
      dockerfile-language-server-nodejs \
      vscode-json-languageserver \
      yaml-language-server \
      typescript-language-server \
      typescript \
      vim-language-server \
      vls \
      pyright \
      svelte-language-server
  )
}

install_lsp_terraform() {
  echo
  echo "Installing terraform language server"
  echo
  (
    TFLSVER=${TFLSVER:-0.17.1}
    TFLSARCH=${TFLSARCH:-amd64}
    TFLSOS=${TFLSOS:-$mcode}
    curl -sfLo "${HOME}"/bin/terraform-ls.zip "https://releases.hashicorp.com/terraform-ls/${TFLSVER}/terraform-ls_${TFLSVER}_${TFLSOS}_${TFLSARCH}.zip"
    rm "$HOME"/bin/terraform-ls
    unzip "${HOME}"/bin/terraform-ls.zip -d "${HOME}"/bin
    rm "${HOME}"/bin/terraform-ls.zip
    chmod 755 "${HOME}"/bin/terraform-ls
  )
}

install_lsp_servers_cargo() {

  if [[ ! -x $(command -v rustup) ]]; then
    echo "Rustup not found, not skipping cargo based lsp servers"
    return
  fi

  echo
  echo "Installing rust and tex language servers"
  echo
  (
    echo "Fetching the rust analyzer language server"
    rustup component add rust-src
    rustup +nightly component add rust-analyzer-preview

    echo "Building the tex language server"
    cargo install --git https://github.com/latex-lsp/texlab.git --locked
  )
}

install_lsp_servers_go() {

  if [[ ! -x $(command -v go) ]]; then
    echo "go not found, not skipping go based lsp servers"
    return
  fi

  echo
  echo "Installing language servers"
  echo
  (
    echo "Installing the go language server"
    (
      # this is needed because go get is bad
      set -x
      set +e
      GO111MODULE=on go get golang.org/x/tools/gopls@latest
    )
    echo "Installing efm general purpose ls"
    go get github.com/mattn/efm-langserver
  )
}

install_lsp_servers_python() {

  if [[ ! -x $(command -v pip) ]]; then
    echo "pip not found, not skipping pip based lsp servers"
    return
  fi

  echo
  echo "Installing the python language server"
  echo
  (
    pip install --quiet python-language-server
  )
}
install_lsp_servers_lua() {
  echo
  echo "Building the lua language server"
  echo
  (
      mkdir -p "${HOME}"/src
      cd "${HOME}"/src
      if [ -d lua-language-server/.git ]; then
        cd lua-language-server
        git pull
      else
        git clone https://github.com/sumneko/lua-language-server
        cd lua-language-server
      fi
      git submodule update --init --recursive
      cd 3rd/luamake
      compile/install.sh
      cd ../..
      ./3rd/luamake/luamake rebuild
  )
}

install_lsp_linters() {
  echo
  echo "Installing linters for efm"
  echo
  (
      npm install -g prettier eslint_d @fsouza/prettierd
      docker pull hadolint/hadolint
  )
}
install_lsp_servers() {
  echo
  echo "Installing language servers"
  echo
  (
    install_lsp_servers_npm
    install_lsp_terraform
    install_lsp_servers_cargo
    install_lsp_servers_go
    install_lsp_servers_python
    install_lsp_servers_lua
    install_lsp_linters

    echo
    echo
    echo "Language servers installed"
    echo
    cd "${HOME}"
  )
}

usage() {
  echo "all, node, rust, python, golang, terraform, lua, lint"
}
main() {
  local cmd=$1

  if [[ -z "$cmd" ]]; then
    usage
    exit 1
  fi

  if [[ $cmd == "all" ]]; then
    install_lsp_servers
  elif [[ $cmd == "node" ]]; then
    install_lsp_servers_npm
  elif [[ $cmd == "rust" ]]; then
    install_lsp_servers_cargo
  elif [[ $cmd == "python" ]]; then
    install_lsp_servers_python
  elif [[ $cmd == "golang" ]]; then
    install_lsp_servers_go
  elif [[ $cmd == "terraform" ]]; then
    install_lsp_terraform
  elif [[ $cmd == "lua" ]]; then
    install_lsp_servers_lua
  elif [[ $cmd == "lint" ]]; then
    install_lsp_linters
  else
    usage
  fi
}

main "$@"
