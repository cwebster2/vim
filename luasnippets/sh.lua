local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("#!", { t({ "#!/bin/bash", "" }) }),

  s("if", {
    t("if [[ "),
    i(1, "condition"),
    t({ " ]]; then", "\t" }),
    i(0),
    t({ "", "fi" }),
  }),

  s("elif", {
    t("elif [[ "),
    i(1, "condition"),
    t({ " ]]; then", "\t" }),
    i(0),
  }),

  s("for", fmt("for (( {} = 0; {} < {}; {}++ )); do\n\t{}\ndone", {
    i(1, "i"),
    rep(1),
    i(2, "count"),
    rep(1),
    i(0),
  })),

  s("wh", {
    t("while [[ "),
    i(1, "condition"),
    t({ " ]]; do", "\t" }),
    i(0),
    t({ "", "done" }),
  }),

  s("until", {
    t("until [[ "),
    i(1, "condition"),
    t({ " ]]; do", "\t" }),
    i(0),
    t({ "", "done" }),
  }),

  s("case", fmt("case {} in\n\t{})\n\t\t{};\nesac", { i(1, "word"), i(2, "pattern"), i(0) })),
}
