local M = {}

local lsp = vim.lsp
local handlers = lsp.handlers
local util = require("cwebster.utils")

function M.setup()

  -- handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  --   if err ~= nil or result == nil then
  --       return
  --   end
  --   if not vim.api.nvim_buf_get_option(bufnr, "modified") then
  --       local view = vim.fn.winsaveview()
  --       lsp.util.apply_text_edits(result, bufnr)
  --       vim.fn.winrestview(view)
  --       vim.api.nvim_command("noautocmd :update")
  --   end
  -- end

  vim.diagnostic.config({
    underline = true,
    virtual_text = {
      source = "if_many",
      spacing = 3,
      prefix = '←',
    },
    virtual_lines = false,
    signs = true,
    severity_sort = true,
    update_in_insert = true,
  })

  -- use this in per-server setups to override
  -- handlers["textDocument/publishDiagnostics"] = lsp.with(
  --   lsp.diagnostic.on_publish_diagnostics, {
  --     underline = true,
  --     virtual_text = {
  --       source = "if_many",
  --       spacing = 3,
  --       prefix = '←',
  --     },
  --     signs = true,
  --     update_in_insert = false,
  --   }
  -- )

  -- local pop_opts = { border = "rounded", max_width = 80 }
  -- handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
  -- handlers["textDocument/signature_help"] = lsp.with(handlers.signature_help, pop_opts)

  -- handlers["$/progress"] = function(_, result, ctx)
  --   local client_id = ctx.client_id

  --   local val = result.value

  --   if not val.kind then
  --     return
  --   end

  --   local notif_data = util.get_notif_data(client_id, result.token)

  --   if val.kind == "begin" then
  --     local message = util.format_message(val.message, val.percentage)

  --     notif_data.notification = vim.notify(message, "info", {
  --       title = util.format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
  --       icon = util.spinner_frames[1],
  --       timeout = false,
  --       hide_from_history = false,
  --     })

  --     notif_data.spinner = 1
  --     util.update_spinner(client_id, result.token)
  --   elseif val.kind == "report" and notif_data then
  --     notif_data.notification = vim.notify(util.format_message(val.message, val.percentage), "info", {
  --       replace = notif_data.notification,
  --       hide_from_history = false,
  --     })
  --   elseif val.kind == "end" and notif_data then
  --     notif_data.notification =
  --       vim.notify(val.message and util.format_message(val.message) or "Complete", "info", {
  --         icon = "",
  --         replace = notif_data.notification,
  --         timeout = 3000,
  --       })

  --     notif_data.spinner = nil
  --   end
  -- end

  local severity = {
    "error",
    "warn",
    "info",
    "info", -- map both hint and info to info?
  }
  vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
    vim.notify(method.message, severity[params.type])
  end

end

return M
