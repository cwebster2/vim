return {
  formatCommand = "prettierd ${INPUT}",
  formatStdin = true,
  env = {
    string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/lua/cwebster/lsp/efm/prettierrc.json')),
  }
}
