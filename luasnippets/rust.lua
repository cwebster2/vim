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
  -- Printing / debugging
  s("pl", fmt('println!("{}"{});', { i(1, "{}"), i(0) })),
  s("plv", fmt('println!("{}: {{:?}}", {});', { rep(1), i(1, "var") })),
  s("dbg", fmt("dbg!(&{});", { i(0) })),
  s("epl", fmt('eprintln!("{}"{});', { i(1, "{}"), i(0) })),
  s("fmt", fmt('format!("{}", {})', { i(1, "{}"), i(0) })),
  s("todo", fmt('todo!("{}")', { i(0) })),
  s("unimpl", fmt('unimplemented!("{}")', { i(0) })),

  -- Functions
  s("fn", fmt([[
fn {}({}) -> {} {{
    {}
}}]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("pfn", fmt([[
pub fn {}({}) -> {} {{
    {}
}}]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("afn", fmt([[
async fn {}({}) -> {} {{
    {}
}}]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("pafn", fmt([[
pub async fn {}({}) -> {} {{
    {}
}}]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("main", fmt([[
fn main() {{
    {}
}}]], { i(0) })),

  s("amain", fmt([[
#[tokio::main]
async fn main() -> Result<()> {{
    {}
    Ok(())
}}]], { i(0) })),

  s("cl", fmt("|{}| {}", { i(1), i(0) })),
  s("clm", fmt([[
|{}| {{
    {}
}}]], { i(1), i(0) })),

  -- Structs, enums, traits
  s("st", fmt([[
struct {} {{
    {}
}}]], { i(1, "Name"), i(0) })),

  s("pst", fmt([[
pub struct {} {{
    {}
}}]], { i(1, "Name"), i(0) })),

  s("stt", fmt([[
struct {}({});]], { i(1, "Name"), i(0, "Type") })),

  s("en", fmt([[
enum {} {{
    {},
}}]], { i(1, "Name"), i(0) })),

  s("pen", fmt([[
pub enum {} {{
    {},
}}]], { i(1, "Name"), i(0) })),

  s("tr", fmt([[
trait {} {{
    {}
}}]], { i(1, "Name"), i(0) })),

  s("ptr", fmt([[
pub trait {} {{
    {}
}}]], { i(1, "Name"), i(0) })),

  -- Impl blocks
  s("imp", fmt([[
impl {} {{
    {}
}}]], { i(1, "Type"), i(0) })),

  s("impf", fmt([[
impl {} for {} {{
    {}
}}]], { i(1, "Trait"), i(2, "Type"), i(0) })),

  s("impdis", fmt([[
impl fmt::Display for {} {{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {{
        write!(f, "{}", {})
    }}
}}]], { i(1, "Type"), i(2, "{}"), i(0, "self") })),

  s("new", fmt([[
pub fn new({}) -> Self {{
    Self {{
        {}
    }}
}}]], { i(1), i(0) })),

  -- Error handling
  s("res", fmt("Result<{}, {}>", { i(1, "T"), i(0, "Error") })),
  s("ok", fmt("Ok({})", { i(0) })),
  s("er", fmt("Err({})", { i(0) })),
  s("some", fmt("Some({})", { i(0) })),

  s("match", fmt([[
match {} {{
    {} => {},
    {} => {},
}}]], { i(1, "expr"), i(2, "pattern"), i(3), i(4, "_"), i(0) })),

  s("mopt", fmt([[
match {} {{
    Some({}) => {},
    None => {},
}}]], { i(1, "opt"), i(2, "val"), i(3), i(0) })),

  s("mres", fmt([[
match {} {{
    Ok({}) => {},
    Err({}) => {},
}}]], { i(1, "result"), i(2, "val"), i(3), i(4, "e"), i(0) })),

  s("ifl", fmt([[
if let Some({}) = {} {{
    {}
}}]], { i(1, "val"), i(2, "opt"), i(0) })),

  s("ifle", fmt([[
if let Ok({}) = {} {{
    {}
}}]], { i(1, "val"), i(2, "result"), i(0) })),

  s("whl", fmt([[
while let Some({}) = {} {{
    {}
}}]], { i(1, "val"), i(2, "iter.next()"), i(0) })),

  -- Control flow
  s("if", fmt([[
if {} {{
    {}
}}]], { i(1, "condition"), i(0) })),

  s("ife", fmt([[
if {} {{
    {}
}} else {{
    {}
}}]], { i(1, "condition"), i(2), i(0) })),

  s("for", fmt([[
for {} in {} {{
    {}
}}]], { i(1, "item"), i(2, "iter"), i(0) })),

  s("loop", fmt([[
loop {{
    {}
}}]], { i(0) })),

  s("wh", fmt([[
while {} {{
    {}
}}]], { i(1, "condition"), i(0) })),

  -- Tests
  s("test", fmt([[
#[test]
fn {}() {{
    {}
}}]], { i(1, "test_name"), i(0) })),

  s("tmod", fmt([[
#[cfg(test)]
mod tests {{
    use super::*;

    #[test]
    fn {}() {{
        {}
    }}
}}]], { i(1, "test_name"), i(0) })),

  s("atest", fmt([[
#[tokio::test]
async fn {}() {{
    {}
}}]], { i(1, "test_name"), i(0) })),

  s("aeq", fmt("assert_eq!({}, {});", { i(1, "left"), i(0, "right") })),
  s("ane", fmt("assert_ne!({}, {});", { i(1, "left"), i(0, "right") })),
  s("ass", fmt("assert!({});", { i(0, "condition") })),

  -- Derive & attributes
  s("der", fmt("#[derive({})]", { i(0, "Debug, Clone") })),
  s("ders", fmt("#[derive(Debug, Clone, Serialize, Deserialize)]", {})),
  s("allow", fmt("#[allow({})]", { i(0, "dead_code") })),
  s("cfg", fmt("#[cfg({})]", { i(0, "test") })),

  -- Common types
  s("vec", fmt("Vec<{}>", { i(0, "T") })),
  s("hm", fmt("HashMap<{}, {}>", { i(1, "K"), i(0, "V") })),
  s("hs", fmt("HashSet<{}>", { i(0, "T") })),
  s("arc", fmt("Arc<{}>", { i(0, "T") })),
  s("mutex", fmt("Mutex<{}>", { i(0, "T") })),
  s("box", fmt("Box<{}>", { i(0, "T") })),
  s("rc", fmt("Rc<{}>", { i(0, "T") })),
  s("opt", fmt("Option<{}>", { i(0, "T") })),
  s("cow", fmt("Cow<'_, {}>", { i(0, "str") })),
  s("pin", fmt("Pin<Box<{}>>", { i(0, "dyn Future<Output = ()>") })),

  -- Use statements
  s("use", fmt("use {};", { i(0) })),
  s("usec", fmt("use {}::{{{}}};\n", { i(1, "crate"), i(0) })),

  -- Lifetime & generics
  s("lt", fmt("<'{}>", { i(0, "a") })),

  -- Module
  s("mod", fmt([[
mod {} {{
    {}
}}]], { i(1, "name"), i(0) })),

  s("pmod", fmt([[
pub mod {};]], { i(0, "name") })),

  -- Serde
  s("serde", {
    t({ "#[derive(Debug, Clone, Serialize, Deserialize)]", "" }),
    t({ "#[serde(rename_all = \"camelCase\")]", "" }),
    t("pub struct "),
    i(1, "Name"),
    t({ " {", "    " }),
    i(0),
    t({ "", "}" }),
  }),
}
