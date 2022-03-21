local M = {}
local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local u = require'cwebster.utils'.u
local theme = require'cwebster.colors'
local colors = theme.theme_colors
local mode_color = theme.mode_color
local gps = require("nvim-gps")
local lsp_status = require("lsp-status")

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

local ViMode = {
    -- get vim current mode, this information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    -- Now we define some dictionaries to map the output of mode() to the
    -- corresponding string and color. We can put these into `static` to compute
    -- them at initialisation time.
    static = {
        mode_names = { -- change the strings if yow like it vvvvverbose!
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },
        mode_colors = mode_color,
        -- bg_color = colors.none,
    },
    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long. Plus a nice Icon.
    provider = function(self)
        return "%2("..self.mode_names[self.mode].."%)"
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], style = "bold", bg=colors.none, }
    end,
}

local Spell = {
    condition = function()
        return vim.wo.spell
    end,
    provider = ' SPELL',
    hl = { style = 'bold', fg = colors.red, bg = colors.none}
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = colors.yellow, bg = colors.none },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = {fg = colors.yellow, bg = colors.none}
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = colors.diff.add },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = colors.diff.delete },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = colors.diff.change },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local WorkDir = {
    provider = function()
        local icon = "  "
        local cwd = vim.fn.getcwd(0)
        cwd = vim.fn.fnamemodify(cwd, ":t")
        return icon .. cwd  .. " "
    end,
    hl = { fg = colors.blue, bg = colors.none },
}


local FileNameBlock = {
    -- let's first set up some attributes needed by this component and it's children
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}
-- We can now define some children separately and add them later

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
    {
        provider = function() if vim.bo.modified then return "[+]" end end,
        hl = { fg = colors.green }

    }, {
        provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return "" end end,
        hl = { fg = colors.red }
    }
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = colors.cyan, style = 'bold', force=true }
        end
    end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
    FileIcon,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    unpack(FileFlags), -- A small optimisation, since their parent does nothing
    { provider = '%<'} -- this means that the statusline is cut here when there's not enough space
)

local Gps = {
    condition = gps.is_available,
    provider = gps.get_location,
    hl = { fg = colors.magenta },
}
-- local Gps = utils.make_flexible_component(3, Gps, { provider = "" })

local Spacer = {
  hl = { bg = colors.none },
  provider = " ",
}

local Align = {
  hl = { bg = colors.none },
  provider = "%=",
}

local DAPMessages = {
    -- display the dap messages only on the debugged file
    condition = function()
        local session = require("dap").session()
        if session then
            local filename = vim.api.nvim_buf_get_name(0)
            if session.config then
                local progname = session.config.program
                return filename == progname
            end
        end
        return false
    end,
    provider = function()
        return " " .. require("dap").status()
    end,
    hl = { fg = utils.get_highlight('Debug').fg },
}

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    -- {
    --     provider = "![",
    -- },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.yellow },
    },
    -- {
    --     provider = function(self)
    --         return self.info > 0 and (self.info_icon .. self.info .. " ")
    --     end,
    --     hl = { fg = colors.diag.info },
    -- },
    -- {
    --     provider = function(self)
    --         return self.hints > 0 and (self.hint_icon .. self.hints)
    --     end,
    --     hl = { fg = colors.diag.hint },
    -- },
    -- {
    --     provider = "]",
    -- },
}

local LSPMessages = {
    provider = function() return lsp_status.status() end,
    hl = { fg = colors.blue },
}

local LSPActive = {
    condition = conditions.lsp_attached,

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in ipairs(vim.lsp.buf_get_clients(0)) do
            local servername = u 'f817' .. server.name
            table.insert(names, servername)
        end
        return table.concat(names, " ")
    end,
    hl = { fg = colors.blue, bg = colors.none },
}

local FileType = {
    provider = function()
        return string.lower(vim.bo.filetype)
    end,
    -- hl = { fg = utils.get_highlight("Type").fg, style = 'bold' },
    hl = { fg = colors.gray },
}

local FileEncoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        enc = enc .. " "
        return enc ~= 'utf-8 ' and enc:upper()
    end
}

local FileFormat = {
    provider = function()
        local fmt = vim.bo.fileformat
        local icon = icons[fmt] or fmt
        -- return fmt ~= 'unix' and fmt:upper()
        return icon
    end,
    hl = { fg = colors.gray}
}

local FileSize = {
    provider = function()
        -- stackoverflow, compute human readable file size
        local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize <= 0 then
            return "0"..suffix[1]
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i])
    end
}

-- We're getting minimalists here!
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%3l:%2c",
    hl = { fg = colors.fg },
}

-- I take no credits for this! :lion:
local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = colors.gray, },
}

local statusline = {
-- left
-- vi mode
  ViMode,
  Spell,
-- directory/git repo
  WorkDir,
-- git branch / stats
  Git,
  Spacer,

-- filename (with path?)
  FileNameBlock,
  Spacer,
-- diagnostics

-- center
-- nvim gps / nearest symbol
  Gps,
  Diagnostics,
  Spacer,
-- debugger?
  DAPMessages,
  Align,

-- right
  LSPMessages,
-- filetype
  FileFormat,
  Spacer,
  FileType,
  Spacer,
  FileEncoding,
  LSPActive,
  Spacer,
-- size?
  FileSize,
  Spacer,
-- line/col
  Ruler,
-- nvim scrollbar
  ScrollBar,
}

function M.setup()
  heirline.setup(statusline)
end

return M
