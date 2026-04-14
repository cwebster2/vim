local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s("date", {
    f(function()
      return os.date("%Y-%m-%d")
    end),
  }),

  s("datetime", {
    f(function()
      return os.date("%Y-%m-%d %H:%M:%S")
    end),
  }),

  s("c)", {
    t("Copyright "),
    f(function()
      return os.date("%Y")
    end),
    t(" "),
    i(1, "Author"),
    t(". All Rights Reserved."),
    i(0),
  }),

  s("lorem", {
    t({
      "Lorem ipsum dolor sit amet, consectetur magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
      "ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate",
      "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in",
      "culpa qui officia deserunt mollit anim id est laborum",
    }),
    i(0),
  }),
}
