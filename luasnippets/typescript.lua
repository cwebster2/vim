local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- Logging
  s("log", fmt("console.log({})", { i(1) })),
  s("logv", fmt('console.log("{}: ", {})', { rep(1), i(1) })),
  s("loge", fmt("console.error({})", { i(1) })),
  s("logw", fmt("console.warn({})", { i(1) })),

  -- Variables & types
  s("co", fmt("const {} = {}", { i(1, "name"), i(0) })),
  s("le", fmt("let {} = {}", { i(1, "name"), i(0) })),

  -- Type definitions
  s("int", fmt([[
interface {} {{
  {}
}}]], { i(1, "Name"), i(0) })),

  s("type", fmt("type {} = {}", { i(1, "Name"), i(0) })),

  s("enum", fmt([[
enum {} {{
  {},
}}]], { i(1, "Name"), i(0) })),

  -- Functions
  s("af", fmt([[
const {} = ({}) => {{
  {}
}}]], { i(1, "name"), i(2), i(0) })),

  s("aft", fmt([[
const {} = ({}): {} => {{
  {}
}}]], { i(1, "name"), i(2), i(3, "void"), i(0) })),

  s("fn", fmt([[
function {}({}): {} {{
  {}
}}]], { i(1, "name"), i(2), i(3, "void"), i(0) })),

  s("afn", fmt([[
async function {}({}): Promise<{}> {{
  {}
}}]], { i(1, "name"), i(2), i(3, "void"), i(0) })),

  -- Control flow
  s("if", fmt([[
if ({}) {{
  {}
}}]], { i(1, "condition"), i(0) })),

  s("ife", fmt([[
if ({}) {{
  {}
}} else {{
  {}
}}]], { i(1, "condition"), i(2), i(0) })),

  s("tc", fmt([[
try {{
  {}
}} catch ({}) {{
  {}
}}]], { i(1), i(2, "err"), i(0) })),

  s("tcf", fmt([[
try {{
  {}
}} catch ({}) {{
  {}
}} finally {{
  {}
}}]], { i(1), i(2, "err"), i(3), i(0) })),

  s("sw", fmt([[
switch ({}) {{
  case {}:
    {}
    break
  default:
    {}
}}]], { i(1, "key"), i(2, "value"), i(3), i(0) })),

  -- Iteration
  s("forof", fmt([[
for (const {} of {}) {{
  {}
}}]], { i(1, "item"), i(2, "items"), i(0) })),

  s("forin", fmt([[
for (const {} in {}) {{
  {}
}}]], { i(1, "key"), i(2, "obj"), i(0) })),

  s("fori", fmt([[
for (let {} = 0; {} < {}; {}++) {{
  {}
}}]], { i(1, "i"), rep(1), i(2, "length"), rep(1), i(0) })),

  -- Promises & async
  s("pr", fmt([[
new Promise<{}>((resolve, reject) => {{
  {}
}})]], { i(1, "void"), i(0) })),

  s("aw", fmt("await {}", { i(0) })),

  -- Classes
  s("cl", fmt([[
class {} {{
  constructor({}) {{
    {}
  }}

  {}
}}]], { i(1, "Name"), i(2), i(3), i(0) })),

  s("cle", fmt([[
class {} extends {} {{
  constructor({}) {{
    super({})
    {}
  }}

  {}
}}]], { i(1, "Name"), i(2, "Base"), i(3), i(4), i(5), i(0) })),

  -- Testing
  s("desc", fmt([[
describe("{}", () => {{
  {}
}})]], { i(1), i(0) })),

  s("it", fmt([[
it("{}", () => {{
  {}
}})]], { i(1), i(0) })),

  s("ita", fmt([[
it("{}", async () => {{
  {}
}})]], { i(1), i(0) })),

  s("bfe", fmt([[
beforeEach(() => {{
  {}
}})]], { i(0) })),

  s("afe", fmt([[
afterEach(() => {{
  {}
}})]], { i(0) })),

  s("exp", fmt("expect({}).{}({})", { i(1), i(2, "toBe"), i(3) })),

  -- Imports / Exports
  s("imp", fmt('import {{ {} }} from "{}"', { i(2), i(1) })),
  s("impd", fmt('import {} from "{}"', { i(2), i(1) })),
  s("impt", fmt('import type {{ {} }} from "{}"', { i(2), i(1) })),
  s("exp", fmt("export {{ {} }}", { i(0) })),
  s("expd", fmt("export default {}", { i(0) })),

  -- Zod (common TS validation)
  s("zobj", fmt([[
const {} = z.object({{
  {}
}})]], { i(1, "schema"), i(0) })),

  -- React / JSX
  s("uef", fmt([[
useEffect(() => {{
  {}
  return () => {{
    {}
  }}
}}, [{}])]], { i(1), i(2), i(0) })),

  s("ust", fmt("const [{}, {}] = useState{}({})", { i(1, "state"), i(2, "setState"), i(3, "<T>"), i(0) })),

  s("urf", fmt("const {} = useRef{}({})", { i(1, "ref"), i(2, "<T>"), i(0, "null") })),

  s("ucb", fmt([[
const {} = useCallback(({}) => {{
  {}
}}, [{}])]], { i(1, "fn"), i(2), i(3), i(0) })),

  s("umo", fmt([[
const {} = useMemo(() => {{
  {}
}}, [{}])]], { i(1, "value"), i(2), i(0) })),

  -- Module / file boilerplate
  s("mf", {
    f(function()
      local name = vim.fn.expand("%:t:r")
      if name == "" then return "module" end
      return name
    end),
  }),
}
