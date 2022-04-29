local M = {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function M.setup()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local lspkind = require("lspkind")

  cmp.setup {
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        menu = ({
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
          spell = "(Spell)",
        })

        -- before = function(entry, vim_item)
        --   vim_item.dup = ({
        --     buffer = 1,
        --     path = 1,
        --     nvim_lsp = 0,
        --   })[entry.source.name] or 0

        --   return vim_item
        -- end
      })
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    sources = cmp.config.sources({
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lua" },
    },{
      { name = "buffer" },
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "spell" },
    }),
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          -- local copilot_keys = vim.fn["copilot#Accept"]()
          -- if copilot_keys ~= "" then
          --   vim.api.nvim_feedkeys(copilot_keys, "i", true)
          -- else
            fallback()
          -- end
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    },
  }

  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp-git' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'nvim_lsp_document_symbol'}
    },{
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end


-- M.icons = {
--   Class = " Class",
--   Color = " Color",
--   Constant = "ﲀ Constant",
--   Constructor = " Constructor",
--   Enum = "練Enum",
--   EnumMember = " EnumMember",
--   Event = " Event",
--   Field = " Field",
--   File = " File",
--   Folder = " Folder",
--   Function = " Function",
--   Interface = "ﰮ Interface",
--   Keyword = " Keyword",
--   Method = " Method",
--   Module = " Module",
--   Operator = " Operator",
--   Property = " Property",
--   Reference = " Reference",
--   Snippet = " Snippet",
--   Struct = " Struct",
--   Text = " Text",
--   TypeParameter = " Type",
--   Unit = "塞Unit",
--   Value = " Value",
--   Variable = " Variable",
-- }

return M
