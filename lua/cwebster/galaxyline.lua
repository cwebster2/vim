local gl = require('galaxyline')
local gls = gl.section
local whitespace = require('galaxyline.providers.whitespace')
local extension = require('galaxyline.providers.extensions')
local fileinfo = require 'galaxyline.providers.fileinfo'
local diagnostic = require('galaxyline.providers.diagnostic')
local conditions = require('galaxyline.condition')
local vcs = require('galaxyline.providers.vcs')
local u = require'cwebster.utils'.u
local theme = require'cwebster.theme'
local colors = theme.galaxyline_colors
local mode_color = theme.mode_color
local gps = require("nvim-gps")
local lsp_status = require("lsp-status")
local lsp = vim.lsp


gl.short_line_list = {
    'LuaTree',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug',
    'NvimTree',
    'OUTLINE'
}

local sep = {
  slant_left = ' ',
  slant_right = '',
  slant_alt_left = '🭀',
  slant_alt_right = '🭋',
  right_filled = u 'e0b2',
  left_filled = u 'e0b0',
  right = u 'e0b3',
  left = u 'e0b1',
}

local icons = {
  locked = "🔒",
  unsaved = u 'f693',
  dos = u 'e70f',
  unix = u 'f17c',
  mac = u 'f179',
  error = '✘',
  warning = '⚠',
  branch = '',
  git = ' ',
  lineno = ' ',
  func = ' '..u '1d453',
}

local mode_map = {
  n = '<N>',
  i = '<I>',
  c= '<C>',
  V= '<V>',
  [''] = '<V>',
  v ='<V>',
  --c  = 'COMMAND-LINE',
  ['r?'] = ':CONFIRM',
  rm = '--MORE',
  R  = '<R>',
  Rv = 'VIRTUAL',
  s  = '<S>',
  S  = '<S>',
  ['r']  = 'HIT-ENTER',
  [''] = '<S>',
  t  = '<T>',
  ['!']  = 'SHELL',
}

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local function mode_label() return mode_map[vim.fn.mode()] or 'N/A' end
local function mode_hl() return mode_color[vim.fn.mode()] or colors.none end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand '%:t') ~= 1 then return true end
  return false
end

local function wide_enough()
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > 80 then return true end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left = {
  {
    FirstElement = {
      provider = function() return ' ' end,
      highlight = {colors.blue,colors.none}
    },
  },
  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        highlight("GalaxyViMode", mode_hl(), colors.none, "bold" )
        return mode_label() .. " "
      end,
      highlight = {mode_hl(), colors.none, 'bold'},
    },
  },
  {
    Spelling = {
      provider = function()
        if vim.api.nvim_win_get_option(0, 'spell') then
          return ' SPELL '
        end
      end,
      highlight = {colors.red, colors.none},
      event = 'OptionSet',
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color,colors.none},
    },
  },
  {
    FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      highlight = {colors.fg,colors.none,'italic'}
    }
  },
  {
    FileSize = {
      provider = 'FileSize',
      condition = buffer_not_empty and checkwidth,
      highlight = {colors.diff.change, colors.none}
    }
  },
  {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        highlight = {colors.blue, colors.none},
    }
  },
  {
    GitBranch = {
      provider = function() return vim.b.gitsigns_head end,
      icon = icons.branch .. " ",
      condition = vcs.check_git_workspace,
      highlight = {colors.yellow ,colors.none},
    }
  },
  {
    spacer = {
      provider = function() return " " end,
      condition = buffer_not_empty and checkwidth,
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.diff.add, colors.none},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.diff.change, colors.none},
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.diff.remove,colors.none},
    }
  },
  {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = " ✘ ",
      highlight = {colors.red, colors.none}
    }
  },
  {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.yellow, colors.none}
    }
  },
  -- {
  --   LeftEnd = {
  --     provider = function() return "" end,
  --     -- separator = sep.slant_alt_left,
  --     separator = sep.slant_left,
  --     separator_highlight = {colors.line_bg,colors.bg_none},
  --     highlight = {colors.line_bg,colors.none}
  --   }
  -- },
}

gls.mid = {
  {
    NvimGPS = {
      provider = function() return "" end, --gps.get_location() end,
      condition = function() return gps.is_available() end,
      highlight = {colors.fg_gutter, colors.none},
      separator_highlight = {colors.fg_gutter, colors.none}
    }
  },
}

--gls.left[11] = {
--    TrailingWhiteSpace = {
--     provider = TrailingWhiteSpace,
--     icon = '  ',
--     highlight = {colors.yellow,colors.bg},
--    }
--}

gls.right = {
  {
    LspStatusStatus = {
      provider = function()
        return lsp_status.status()
      end,
      condition = conditions.hide_in_width and buffer_not_empty,
      highlight = {colors.blue}
    }
  },
  {
    FileType = {
      provider = function()
        local icon = icons[vim.bo.fileformat] or ''
        return string.format('%s %s ', icon, vim.bo.filetype)
      end,
      condition = conditions.hide_in_width and buffer_not_empty,
      highlight = {colors.gray,colors.bg_none}
    },
 },
 {
   FileEncoding = {
     provider = function()
        local encoding = string.lower(fileinfo.get_file_encode())
        encoding = encoding:gsub("^%s*(.-)%s*$", "%1")
        if encoding == "utf-8" then
          return ''
        end
        return encoding..' '
      end,
     condition = conditions.hide_in_width,
      highlight = {colors.gray,colors.bg_none}
   }
 },
 -- {
 --    RightEnd = {
 --      provider = function() return "" end,
 --      separator = sep.slant_alt_right,
 --      separator_highlight = {colors.line_bg,colors.bg_none},
 --      highlight = {colors.line_bg,colors.none}
 --    }
 --  },
  {
    LspStatus = {
      provider = function()
        local clients = vim.lsp.buf_get_clients(0)
        local connected = not vim.tbl_isempty(clients)
        if connected then
          local status = ''
            for _,client in ipairs(clients) do
              status = status .. u 'f817' .. client.name .. ' '
            end
          return status
        else
          return ''
        end
      end,
      condition = function()
        if conditions.hide_in_width() then
          return true
        end
        if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
          return true
        end
        return false
      end,
      highlight = {colors.blue,colors.none}
    },
  },
  {
    PositionInfo = {
      provider = function() return string.format('%s', fileinfo.line_column()) end,
      highlight = {colors.fg, colors.none},
      condition = buffer_not_empty,
    },
  },
  {
    PositionVis = {
      provider = "ScrollBar",
      highlight = {colors.gray}
    }
  },
  {
    Whitespace = {
      provider = whitespace,
      condition = conditions.hide_in_width
    }
  }
}

gls.short_line_left = {
  {
    BufferType = {
      provider = 'FileTypeName',
      condition = has_file_type,
      highlight = {colors.gray,colors.line_bg}
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color,colors.line_bg},
    },
  },
  {
    FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      highlight = {colors.fg,colors.line_bg,'italic'}
    }
  },
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    condition = has_file_type,
    highlight = {colors.gray,colors.line_bg}
  }
}
