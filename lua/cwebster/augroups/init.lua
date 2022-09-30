-- Require all other `.lua` files in the same directory

local info = debug.getinfo(1, 'S')
local module_directory = string.match(info.source, '^@(.*)/')
local module_filename = string.match(info.source, '/([^/]*)$')

-- Apparently the name of this module is given as an argument when it is
-- required, and apparently we get that argument with three dots.
local module_name = ... or "config"

local function scandir(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "'..directory..'"')
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

local config_files = vim.tbl_filter(function (filename)
  local is_lua_module = string.match(filename, "[.]lua$")
  local is_this_file = filename == module_filename
  return is_lua_module and not is_this_file
end, scandir(module_directory))

for i, filename in ipairs(config_files) do
  local config_module = string.match(filename, "(.+).lua$")
  require(module_name.."."..config_module)
end
