vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  once = true,
  callback = function()
    require("lazydev").setup({
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    require("blink.compat").setup({})
    require("LuaSnip").setup({})
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/luasnippets" } })
    require("luasnip").filetype_extend("typescriptreact", { "typescript" })
    require("luasnip").filetype_extend("javascriptreact", { "javascript" })
    require("blink-copilot").setup({})
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    })
    require("CopilotChat").setup({})

    require("blink.cmp").setup({
      keymap = {
        preset = "super-tab",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { "copilot", "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
          copilot = { name = "copilot", module = "blink-copilot", score_offset = 100, async = true },
        },
      },
      snippets = { preset = "luasnip" },
      fuzzy = { implementation = "lua" },
      signature = { enabled = true },
    })
  end,
})
