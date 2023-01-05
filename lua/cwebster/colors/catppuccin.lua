local M = {}
local catppuccin = require("catppuccin")
local mocha = require("catppuccin.palettes").get_palette("mocha")

local mocha_overrides = {
  green = "#9ece6a",
}

local my_palette = vim.tbl_deep_extend("force", mocha, mocha_overrides, {
  warning = mocha.yellow,
  info = mocha.blue,
  hint = mocha.teal,
  variable = mocha.text,

	magenta = "#c678dd",
	cyan = "#63cdcf",
	white = "#dfdfe0",
	orange = "#F4A261",
	gray = "#2a2e36",
	none = "NONE",

  diff = {
    add = "green",
    change = "#2B5B77",
    delete = "red",
    text = mocha.blue,
    conflict = mocha.magenta,
  }
})

function M.get_palette()
  return my_palette
end

M.overrides = {
  colors = {
    all = mocha_overrides,
  },
  highlights = {
    all = {
      CmpItemAbbrMatch = { fg = my_palette.blue },
      CmpItemAbbrMatchFuzzy = { fg = my_palette.blue },
		  Pmenu = { bg = my_palette.crust },
		  PmenuSel = { fg = my_palette.sapphire },
		  PmenuSbar = { bg = my_palette.base }, -- Popup menu: scrollbar.
		  PmenuThumb = { bg = my_palette.surface0 }, -- Popup menu: Thumb of the scrollbar.
      VertSplit = { fg = my_palette.surface0 },
      NonText = { fg = my_palette.surface0 },
      HlSearchLensNear = { fg = my_palette.sky, bg = mocha.surface0 },
      HlSearchLens = { fg = my_palette.sky, bg = mocha.surface1 },
      GitSignsAdd = { fg = my_palette.diff.add },
      GitSignsChange = { fg = my_palette.diff.change },
      GitSignsDelete = { fg = my_palette.diff.delete },
    }
    -- mocha = {
    --   ["@field"] = { fg = mocha.rosewater },
    --   TSField = { fg = mocha.rosewater },
    -- }
  }
}

function M.setup()
  catppuccin.setup({
    flavor = "mocha",
    transparent_background = true,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "bold" },
      loops = { "bold" },
      functions = { "italic, bold" },
      keywords = { "italic" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "bold", "italic" },
      properties = { "italic" },
      types = {},
      operators = { "bold" },
    },
    integrations = {
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = true,
      cmp = true,
      gitgutter = true,
      gitsigns = true,
      lsp_trouble = true,
      neogit = true,
      symbols_outline = true,
      telescope = true,
      neotest = true,
      nvimtree = false,
      dashboard = false,
      markdown = true,
      mason = true,
      mini = true,
      notify = true,
      noice = true,
      which_key = true,
      semantic_tokens = true,
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dap = {
        enabled = true,
        enabled_ui = true,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      }
    },
    color_overrides = M.overrides.colors,
    highlight_overrides = M.overrides.highlights,
  })
end

return M
