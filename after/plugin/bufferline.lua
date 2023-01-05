local ok, bufferline = pcall(require, "bufferline")

if not ok then
  print("bufferline not installed, run PackerSync")
  do return end
end

bufferline.setup {
  options = {
    -- mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- numbers = "none" | "ordinal" | "buffer_id" | "both",
    -- number_style = "superscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    -- indicator_icon = '▎',
    indicator = {
      style = "underline"
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    --diagnostics = false | "nvim_lsp",
    --diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = {
      {filetype = "neo-tree", text = "File Explorer", text_align = "center"},
      {filetype = "Outline", text = "Symbol Explorer", text_align = "center"},
    },
    color_icons = true,
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_buffer_default_icon = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = {'', '' }, -- "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, -- | true,
    always_show_bufferline = false,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {"close"},
    }
  },
  highlights = {
    fill = {
      bg = "NONE",
      fg = "NONE",
    },
    background = {
      bg = "NONE",
    },
    buffer_selected = {
      --guifg = '#e8e8d3',
      bg = 'NONE',
      --guisp = '#e8e8d3',
      italic = true,
      bold = true
    },
  --   modified_selected = {
  --     gui = 'underline,italic,bold'
  --   },
  --   warning_selected = {
  --     gui = 'underline,italic,bold'
  --   },
  --   error_selected = {
  --     gui = 'underline,italic,bold'
  --   },
  --   info_selected = {
  --     gui = 'underline,italic,bold'
  --   },
  }
}
