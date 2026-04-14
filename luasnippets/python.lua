local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("#!", { t("#!/usr/bin/python") }),

  s("imp", fmt("import {}", { i(1, "module") })),

  s("docs", {
    t({ "'''", "File: " }),
    f(function()
      local name = vim.fn.expand("%:t")
      return name ~= "" and name or "module.py"
    end),
    t({ "", "Author: " }),
    i(1, "Author"),
    t({ "", "Description: " }),
    i(2),
    t({ "", "'''" }),
  }),

  s("wh", fmt([[
while {}:
	{}]], { i(1, "condition"), i(2, "# code...") })),

  s("for", fmt([[
for {} in {}:
	{}]], { i(1, "needle"), i(2, "haystack"), i(0) })),

  s("cl", fmt([[
class {}({}):
	"""{}"""
	def __init__(self, {}):
		{}
		self.{} = {}
		{}]], {
    i(1, "ClassName"),
    i(2, "object"),
    i(3, "docstring"),
    i(4, "arg"),
    i(5, "super().__init__()"),
    rep(4),
    rep(4),
    i(0),
  })),

  s("def", fmt([[
def {}({}):
	"""{}"""
	{}]], { i(1, "fname"), i(2, "self"), i(3, "docstring"), i(0, "pass") })),

  s("deff", fmt([[
def {}({}):
	{}]], { i(1, "fname"), i(2, "self"), i(0) })),

  s("defs", fmt([[
def {}(self, {}):
	{}]], { i(1, "mname"), i(2, "arg"), i(0, "pass") })),

  s("property", fmt([[
def {}():
	doc = "{}"
	def fget(self):
		{}
	def fset(self, value):
		{}]], { i(1, "foo"), i(2, "The property."), i(3, "return self._foo"), i(4, "self._foo = value") })),

  s("ld", fmt("{} = lambda {} : {}", { i(1, "var"), i(2, "vars"), i(3, "action") })),

  s(".", { t("self.") }),

  s("try", fmt([[
try:
	{}
except {} as {}:
	{}]], { i(1, "pass"), i(2, "Exception"), i(3, "e"), i(4, "raise") })),

  s("tryef", fmt([[
try:
	{}
except {} as {}:
	{}
else:
	{}
finally:
	{}]], { i(1, "pass"), i(2, "Exception"), i(3, "e"), i(4, "raise"), i(5, "pass"), i(6, "pass") })),

  s("ifmain", fmt([[
if __name__ == '__main__':
	{}]], { i(1, "main()") })),

  s("_", fmt("__{}__{}", { i(1, "init"), i(0) })),

  s("doc", fmt([[
"""
	{}
"""]], { i(1, "docstring") })),

  s("ndoc", fmt('""" {} """', { i(1, "docstring") })),

  s("test", fmt([[
def test_{}({}):
	"""
		Tests for: {}

		* {}
	"""]], { i(1, "fname"), i(2, "self"), rep(1), i(3, "testcase") })),
}
