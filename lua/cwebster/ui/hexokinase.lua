local M = {}

M.setup = function()
  vim.g.Hexokinase_highlighters = { 'virtual', 'background', 'backgroundfull'}
  vim.g.Hexokinase_optInPatterns = {
    'full_hex',
    'triple_hex',
    'rgb',
    'rgba',
    'hsl',
    'hsla',
    -- 'colour_names'
  }
end

return M
