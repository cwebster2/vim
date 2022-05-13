#!/usr/bin/env bash
main() {
  echo
  echo "Installing language servers"
  (
    npm install -g eslint prettier eslint_d @fsouza/prettierd
    docker pull hadolint/hadolint
    cargo install stylua
    go install github.com/errata-ai/vale@latest
  )
}

main "$@"
