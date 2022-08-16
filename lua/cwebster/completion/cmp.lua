local M = {}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

function M.setup()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local lspkind = require("lspkind")
  local copilot_cmp = require("copilot_cmp")

  cmp.setup {
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
      end
    end,
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
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
          copilot = "(Copilot)",
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
      { name = "copilot", max_item_count = 3 },
      { name = "nvim_lsp", max_item_count = 5 },
      { name = "path", max_item_count = 3 },
      { name = "luasnip", max_item_count = 5 },
      { name = "nvim_lsp_signature_help", max_item_count = 5 },
      { name = "nvim_lua", max_item_count = 5 },
    },{
      { name = "buffer"},
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "spell" },
    }),
    sorting = {
      --keep priority weight at 2 for much closer matches to appear above copilot
      --set to 1 to make copilot always appear on top
      priority_weight = 2,
      comparators = {
        -- order matters here
        cmp.config.compare.exact,
        copilot_cmp.prioritize,
        copilot_cmp.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.score,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
      },
    },
    -- view = {
    --   entries = 'native'
    -- },
    experimental = {
      ghost_text = true
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        -- elseif has_words_before() then
          -- cmp.complete()
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
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline('/', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   view = {
  --     entries = { name = 'wildmenu', separator = "|" }
  --   },
  --   sources = {
  --     { name = 'nvim_lsp_document_symbol'}
  --   },{
  --     { name = 'buffer' }
  --   }
  -- })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = ""
        vim_item.menu = ""
        return vim_item
      end,
    },
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
