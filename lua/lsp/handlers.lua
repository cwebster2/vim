local M = {}

local lsp = vim.lsp
local handlers = lsp.handlers

function M.setup()
  -- local ok, lsputil = pcall(require, "lsputil")
  -- if ok then
  --   local codeAction = require("lsputil.codeAction")
  --   local locations = require("lsputil.locations")
  --   local symbols = require("lsputil.symbols")
  --   handlers['textDocument/codeAction'] = codeAction.code_action_handler
  --   handlers['textDocument/references'] = locations.references_handler
  --   handlers['textDocument/definition'] = locations.definition_handler
  --   handlers['textDocument/declaration'] = locations.declaration_handler
  --   handlers['textDocument/typeDefinition'] = locations.typeDefinition_handler
  --   handlers['textDocument/implementation'] = locations.implementation_handler
  --   handlers['textDocument/documentSymbol'] = symbols.document_handler
  --   handlers['workspace/symbol'] = symbols.workspace_handler
  -- end

  handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        vim.api.nvim_command("noautocmd :update")
    end
  end

  handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {
        spacing = 4,
        prefix = '←',
      },
      signs = true,
      update_in_insert = false,
    }
  )

  local pop_opts = { border = "rounded", max_width = 80 }
  handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
  handlers["textDocument/signature_help"] = lsp.with(handlers.signature_help, pop_opts)

end

return M
