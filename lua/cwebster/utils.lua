local M = {}

local api = vim.api
local bit = require("bit")


-- Key mapping
function M.map(mode, key, result, opts, desc)
  opts = opts or {}
  local map_opts = {
    -- noremap = opts.noremap or true,
    remap = opts.remap or not opts.noremap or false,
    buffer = opts.buffer or false,
    silent = opts.silent or false,
    expr = opts.expr or false,
    script = opts.script or false,
    desc = opts.desc or desc or nil,
    replace_keycodes = opts.replace_keycodes or nil
  }
  vim.keymap.set(mode, key, result, map_opts)
end

function M.has(value)
  return vim.fn.has(value) == 1
end

function M.exists(value)
  return vim.fn.exists(value) == 1
end

function M.augroup(group_name, definitions)
  api.nvim_command('augroup ' .. group_name)
  api.nvim_command('autocmd!')
  for _, def in ipairs(definitions) do
    local command = table.concat({'autocmd', unpack(def)}, ' ')
    if api.nvim_call_function('exists', {'##' .. def[1]}) ~= 0 then
      api.nvim_command(command)
    end
  end
  api.nvim_command('augroup END')
end

function M.get_color(synID, what, mode)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(synID)), what, mode)
end

function M.u(code)
  if type(code) == 'string' then code = tonumber('0x' .. code) end
  local c = string.char
  if code <= 0x7f then return c(code) end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

function M.scratchBuffer(splitcmd)
  -- make a scratch buffer in a spli
  vim.cmd(splitcmd)
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(win, buf)
end

-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

function M.get_notif_data(client_id, token)
  if not client_notifs[client_id] then
    client_notifs[client_id] = {}
  end

  if not client_notifs[client_id][token] then
    client_notifs[client_id][token] = {}
  end

  return client_notifs[client_id][token]
end


M.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

function M.update_spinner(client_id, token)
  local notif_data = M.get_notif_data(client_id, token)

  if notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #M.spinner_frames
    notif_data.spinner = new_spinner

    notif_data.notification = vim.notify(nil, nil, {
      hide_from_history = true,
      icon = M.spinner_frames[new_spinner],
      replace = notif_data.notification,
    })

    vim.defer_fn(function()
      M.update_spinner(client_id, token)
     end, 100)
  end
end

function M.format_title(title, client_name)
  return client_name .. (#title > 0 and ": " .. title or "")
end

function M.format_message(message, percentage)
  return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- This lets code register on_attach callbacks independently instead of
-- centralizing it in the lsp init
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end
  })
end

return M
