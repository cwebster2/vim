local M = {}

function M.on_attach(client, buf)
  if client.name == "copilot" then return end
  if client.name == "null-ls" then return end
  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint(buf, true)
  else
    print("Inlay hints not supported for this server")
  end
end

return M
