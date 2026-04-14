local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("header", {
    t('" File: '),
    f(function()
      return vim.fn.expand("%:t")
    end),
    t({ "", '" Author: ' }),
    i(1, "Author"),
    t({ "", '" Description: ' }),
    i(2),
    t({ "", '" Last Modified: ' }),
    f(function()
      return os.date("%B %d, %Y")
    end),
  }),

  s("guard", {
    t("if exists('"),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return "did_" .. (name ~= "" and name or "plugin")
    end),
    t({ "') || &cp", "\tfinish", "endif", "let " }),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return "did_" .. (name ~= "" and name or "plugin")
    end),
    t({ " = 1", "" }),
    i(0),
  }),

  s("f", fmt([[
fun {}({})
	{}
endf]], { i(1, "function_name"), i(2), i(0, '" code') })),

  s("for", fmt([[
for {} in {}
	{}
endfor]], { i(1, "needle"), i(2, "haystack"), i(0, '" code') })),

  s("wh", fmt([[
while {}
	{}
endw]], { i(1, "condition"), i(0, '" code') })),

  s("if", fmt([[
if {}
	{}
endif]], { i(1, "condition"), i(0, '" code') })),

  s("ife", fmt([[
if {}
	{}
else
	{}
endif]], { i(1, "condition"), i(2), i(0) })),
}
