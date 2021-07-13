#!/usr/bin/env bash
set -euo pipefail

install_node_dap() {
  pushd "${HOME}" 2>/dev/jull
  npm -g install gulp
  mkdir -p src
  cd src
  git clone https://github.com/microsoft/vscode-node-debug2.git
  cd vscode-node-debug2
  npm install
  gulp build
  popd 2>/dev/null
}

install_all_dap() {
  install_node_dap
}

usage() {
  echo "all, node"
}
main() {
  local cmd=$1

  if [[ -z "$cmd" ]]; then
    usage
    exit 1
  fi

  if [[ $cmd == "all" ]]; then
    install_all_dap
  elif [[ $cmd == "node" ]]; then
    install_node_dap
  # elif [[ $cmd == "rust" ]]; then
  #   install_lsp_servers_cargo
  # elif [[ $cmd == "python" ]]; then
  #   install_lsp_servers_python
  # elif [[ $cmd == "golang" ]]; then
  #   install_lsp_servers_go
  # elif [[ $cmd == "terraform" ]]; then
  #   install_lsp_terraform
  # elif [[ $cmd == "lua" ]]; then
  #   install_lsp_servers_lua
  # elif [[ $cmd == "lint" ]]; then
  #   install_lsp_linters
  else
    usage
  fi
}

main "$@"
