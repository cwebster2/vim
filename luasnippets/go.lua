local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- Error handling (the #1 Go pattern)
  s("ife", fmt([[
if err != nil {{
  return {}
}}]], { i(0, "err") })),

  s("ifel", fmt([[
if err != nil {{
  log.Fatalf("{}: %v", err)
}}]], { i(0, "failed") })),

  s("ifew", fmt([[
if err != nil {{
  return fmt.Errorf("{}: %w", err)
}}]], { i(0, "failed to do something") })),

  -- Variables & short declarations
  s(":", fmt("{} := {}", { i(1, "name"), i(0) })),
  s("var", fmt("var {} {}", { i(1, "name"), i(0, "Type") })),

  -- Functions
  s("fn", fmt([[
func {}({}) {} {{
  {}
}}]], { i(1, "name"), i(2), i(3, "error"), i(0) })),

  s("meth", fmt([[
func ({} {}) {}({}) {} {{
  {}
}}]], { i(1, "r"), i(2, "Receiver"), i(3, "Method"), i(4), i(5, "error"), i(0) })),

  s("main", fmt([[
func main() {{
  {}
}}]], { i(0) })),

  s("init", fmt([[
func init() {{
  {}
}}]], { i(0) })),

  -- Printing
  s("pf", fmt('fmt.Printf("{}", {})', { i(1, "%v\\n"), i(0) })),
  s("pl", fmt("fmt.Println({})", { i(0) })),
  s("sp", fmt('fmt.Sprintf("{}", {})', { i(1, "%v"), i(0) })),
  s("ef", fmt('fmt.Errorf("{}: %w", {})', { i(1, "failed"), i(0, "err") })),
  s("lp", fmt("log.Println({})", { i(0) })),
  s("lf", fmt('log.Fatalf("{}: %v", {})', { i(1, "fatal"), i(0, "err") })),

  -- Structs & interfaces
  s("st", fmt([[
type {} struct {{
  {}
}}]], { i(1, "Name"), i(0) })),

  s("iface", fmt([[
type {} interface {{
  {}
}}]], { i(1, "Name"), i(0) })),

  s("cons", fmt([[
func New{}({}) *{} {{
  return &{}{{
    {}
  }}
}}]], { i(1, "Type"), i(2), rep(1), rep(1), i(0) })),

  -- Control flow
  s("if", fmt([[
if {} {{
  {}
}}]], { i(1, "condition"), i(0) })),

  s("ifen", fmt([[
if {} := {}; {} != nil {{
  {}
}}]], { i(1, "val"), i(2, "expr"), rep(1), i(0) })),

  s("el", fmt([[
}} else {{
  {}]], { i(0) })),

  s("sw", fmt([[
switch {} {{
case {}:
  {}
default:
  {}
}}]], { i(1, "expr"), i(2, "val"), i(3), i(0) })),

  s("swt", fmt([[
switch {} := {}.(type) {{
case {}:
  {}
default:
  {}
}}]], { i(1, "v"), i(2, "expr"), i(3, "Type"), i(4), i(0) })),

  s("sel", fmt([[
select {{
case {} := <-{}:
  {}
default:
  {}
}}]], { i(1, "v"), i(2, "ch"), i(3), i(0) })),

  -- Loops
  s("for", fmt([[
for {} {{
  {}
}}]], { i(1), i(0) })),

  s("fori", fmt([[
for {} := {}; {} < {}; {}++ {{
  {}
}}]], { i(1, "i"), i(2, "0"), rep(1), i(3, "n"), rep(1), i(0) })),

  s("forr", fmt([[
for {}, {} := range {} {{
  {}
}}]], { i(1, "_"), i(2, "v"), i(3, "items"), i(0) })),

  -- Goroutines & channels
  s("go", fmt([[
go func() {{
  {}
}}()]], { i(0) })),

  s("gof", fmt("go {}({})", { i(1, "fn"), i(0) })),

  s("ch", fmt("make(chan {}, {})", { i(1, "Type"), i(0, "0") })),

  -- Defer
  s("df", fmt("defer {}({})", { i(1, "fn"), i(0) })),

  s("dff", fmt([[
defer func() {{
  {}
}}()]], { i(0) })),

  -- Testing
  s("tf", fmt([[
func Test{}(t *testing.T) {{
  {}
}}]], { i(1, "Name"), i(0) })),

  s("bf", fmt([[
func Benchmark{}(b *testing.B) {{
  for {} := 0; {} < b.N; {}++ {{
    {}
  }}
}}]], { i(1, "Name"), i(2, "i"), rep(2), rep(2), i(0) })),

  s("trun", fmt([[
t.Run("{}", func(t *testing.T) {{
  {}
}})]], { i(1, "name"), i(0) })),

  s("tt", fmt([[
tests := []struct {{
  name string
  {}
}}{{
  {{
    name: "{}",
    {}
  }},
}}
for _, tt := range tests {{
  t.Run(tt.name, func(t *testing.T) {{
    {}
  }})
}}]], { i(1, "// fields"), i(2, "test case"), i(3), i(0) })),

  -- Context
  s("ctx", fmt("ctx context.Context", {})),
  s("ctxb", fmt("ctx := context.Background()", {})),
  s("ctxt", fmt("ctx, cancel := context.WithTimeout({}, {})", { i(1, "ctx"), i(0, "timeout") })),
  s("ctxc", fmt("ctx, cancel := context.WithCancel({})", { i(0, "ctx") })),

  -- Common patterns
  s("ok", {
    i(1, "val"),
    t(", ok := "),
    i(2, "expr"),
    t({ "", "if !ok {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("ap", fmt("{} = append({}, {})", { rep(1), i(1, "slice"), i(0, "elem") })),

  s("mk", fmt("{} := make({}, {})", { i(1, "name"), i(2, "[]Type"), i(0, "0") })),

  -- HTTP handlers
  s("hf", fmt([[
func {}(w http.ResponseWriter, r *http.Request) {{
  {}
}}]], { i(1, "handler"), i(0) })),

  -- Map
  s("map", fmt("map[{}]{}", { i(1, "string"), i(0, "Type") })),

  -- Package
  s("pkg", {
    t("package "),
    f(function()
      local dir = vim.fn.expand("%:p:h:t")
      return dir ~= "" and dir or "main"
    end),
  }),
}
