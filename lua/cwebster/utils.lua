local M = {}

local api = vim.api
local bit = require("bit")

-- Key mapping
function M.map(mode, key, result, opts)
  local map_opts = {
    noremap = true,
    silent = opts.silent or false,
    expr = opts.expr or false,
    script = opts.script or false
  }
  if not opts.buffer then
    vim.api.nvim_set_keymap(mode, key, result, map_opts)
  else
    local buffer = opts.buffer
    if buffer == true then
      buffer = 0
    end
    vim.api.nvim_buf_set_keymap(buffer, mode, key, result, map_opts)
  end
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

return M
