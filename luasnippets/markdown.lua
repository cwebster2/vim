local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("meta", {
    t({ "---", "title: " }),
    i(1, "Title"),
    t({ "", "layout: default", "comments: true", "published: true", "---", "", "" }),
    i(0),
  }),
}
