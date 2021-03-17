local M = {}
-- Key mapping
function M.map(mode, key, result, opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {
      noremap = true,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false
    }
  )
end

function M.augroup(group, fn)
  vim.api.nvim_command("augroup " .. group)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup END")
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
return M
