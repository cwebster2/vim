local M = {}

function M.setup()
  require("mason").setup({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })
  require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer", "sumneko_lua", "tsserver" }, -- ensure these servers are always installed
    automatic_installation = true, -- { exclude = { "null-ls" } }, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})
end

return M
