return {
  {
    "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        segments = {
          -- { text = { "%C" }, click = "v:lua.ScFa" },
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { sign = { name = { "neotest", "Dap" }, maxwidth = 1, auto = false },
            click = "v:lua.ScSa"
          },
          {
            sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
            click = "v:lua.ScSa"
          },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          {
            sign = { name = { "GitSigns" }, maxwidth = 1, colwidth = 1, auto = false},
            click = "v:lua.ScSa",
          },
          -- { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
          -- {
          --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
          --   click = "v:lua.ScSa"
          -- },
        },
      }
    end,
  }
}
