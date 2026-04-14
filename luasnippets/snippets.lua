local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("snip", fmt([[
snippet {}
	{}]], { i(1, "trigger"), i(0) })),

  s("msnip", fmt([[
snippet {} {}
	{}]], { i(1, "trigger"), i(2, "description"), i(0) })),
}
