local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("sig", {
    t({ "", "-- ", "" }),
    i(1, "Author"),
    t(" <"),
    i(2, "email@example.com"),
    t(">"),
  }),
}
