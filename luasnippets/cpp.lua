local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("inc", fmt('#include <{}.h>{}', { i(1, "stdio"), i(0) })),

  s("Inc", {
    t('#include "'),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return name ~= "" and name .. ".h" or "header.h"
    end),
    t('"'),
    i(0),
  }),

  s("Def", fmt([[
#ifndef {}
#define {} {}
#endif{}]], { i(1, "SYMBOL"), rep(1), i(2, "value"), i(0) })),

  s("def", { t("#define ") }),

  s("ifdef", fmt([[
#ifdef {}
	{}
#endif]], { i(1, "FOO"), i(2, "#define ") })),

  s("#if", fmt([[
#if {}
	{}
#endif]], { i(1, "FOO"), i(0) })),

  s("once", {
    t("#ifndef "),
    f(function()
      local name = vim.fn.expand("%:t:r"):upper()
      return name ~= "" and name .. "_H" or "UNTITLED_H"
    end),
    t({ "", "#define " }),
    f(function()
      local name = vim.fn.expand("%:t:r"):upper()
      return name ~= "" and name .. "_H" or "UNTITLED_H"
    end),
    t({ "", "" }),
    i(0),
    t({ "", "#endif" }),
  }),

  s("if", fmt([[
if({}) {{
	{}
}}{}]], { i(1, "condition"), i(2, "/* code */"), i(0) })),

  s("el", fmt([[
else {{
	{}
}}{}]], { i(1), i(0) })),

  s("t", fmt("{} ? {} : {}", { i(1, "condition"), i(2, "a"), i(3, "b") })),

  s("do", fmt([[
do {{
	{}
}} while({});]], { i(2, "/* code */"), i(1, "condition") })),

  s("wh", fmt([[
while({}) {{
	{}
}}]], { i(1, "condition"), i(2, "/* code */") })),

  s("for", fmt([[
for(int {} = 0; {} < {}; {}{}) {{
	{}
}}]], { i(2, "i"), rep(2), i(1, "cnt"), i(3, "++"), rep(2), i(4) })),

  s("fore", fmt([[
for(auto {} = {}.begin(), {} = {}.end(); {} != {}; ++{}) {{
	{}
}}]], { i(2, "it"), i(1, "obj"), i(3, "end"), rep(1), rep(2), rep(3), rep(2), i(4) })),

  s("forr", fmt([[
for(int {} = {}; {}; {}{}) {{
	{}
}}]], { i(1, "i"), i(2, "0"), i(3, "i < 10"), i(4, "++"), rep(1), i(5, "/* code */") })),

  s("fun", fmt([[
{} {}({}) {{
	{}
}}]], { i(1, "void"), i(2, "function_name"), i(3), i(4, "/* code */") })),

  s("fund", fmt("{} {}({});{}", { i(1, "void"), i(2, "function_name"), i(3), i(0) })),

  s("td", fmt("typedef {} {};{}", { i(1, "int"), i(2, "MyCustomType"), i(0) })),

  s("st", {
    t("struct "),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return name ~= "" and name .. "_t" or "name"
    end),
    t({ " {", "\t" }),
    i(1, "/* data */"),
    t({ "", "}" }),
    i(2),
    t(";"),
    i(0),
  }),

  s("un", { t("unsigned") }),
}
