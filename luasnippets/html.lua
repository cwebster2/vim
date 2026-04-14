local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- Unicode entities
  s("nbs", { t("&nbsp;") }),
  s("left", { t("&#x2190;") }),
  s("right", { t("&#x2192;") }),
  s("up", { t("&#x2191;") }),
  s("down", { t("&#x2193;") }),
  s("return", { t("&#x21A9;") }),
  s("backtab", { t("&#x21E4;") }),
  s("tab", { t("&#x21E5;") }),
  s("shift", { t("&#x21E7;") }),
  s("control", { t("&#x2303;") }),
  s("enter", { t("&#x2305;") }),
  s("command", { t("&#x2318;") }),
  s("option", { t("&#x2325;") }),
  s("delete", { t("&#x2326;") }),
  s("backspace", { t("&#x232B;") }),
  s("escape", { t("&#x238B;") }),

  -- Doctypes
  s("doct5", { t("<!DOCTYPE HTML>") }),
  s("docts", {
    t({
      '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"',
      '"http://www.w3.org/TR/html4/strict.dtd">',
    }),
  }),
  s("doct", {
    t({
      '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"',
      '"http://www.w3.org/TR/html4/loose.dtd">',
    }),
  }),

  -- Structure
  s("html", fmt([[
<html>
{}
</html>]], { i(0) })),

  s("body", fmt([[
<body>
	{}
</body>]], { i(0) })),

  s("head", {
    t({
      "<head>",
      '\t<meta http-equiv="content-type" content="text/html; charset=utf-8">',
      "",
      "\t<title>",
    }),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return name ~= "" and name:sub(1, 1):upper() .. name:sub(2) or "Page Title"
    end),
    t({ "</title>", "\t" }),
    i(0),
    t({ "", "</head>" }),
  }),

  s("title", {
    t("<title>"),
    f(function()
      local name = vim.fn.expand("%:t:r")
      return name ~= "" and name:sub(1, 1):upper() .. name:sub(2) or "Page Title"
    end),
    t("</title>"),
    i(0),
  }),

  s("script", fmt([[
<script type="text/javascript" charset="utf-8">
	{}
</script>{}]], { i(1), i(0) })),

  s("scriptsrc", fmt('<script src="{}.js" type="text/javascript" charset="utf-8"></script>{}', { i(1), i(0) })),

  s("style", fmt([[
<style type="text/css" media="{}">
	{}
</style>{}]], { i(1, "screen"), i(2), i(0) })),

  s("r", { t("<br>") }),

  s("div", fmt([[
<div id="{}">
	{}
</div>]], { i(1, "name"), i(0) })),

  s("form", fmt([[
<form action="{}" method="{}" accept-charset="utf-8">
	{}

<p><input type="submit" value="Continue &rarr;"></p>
</form>]], { i(1, "submit"), i(2, "get"), i(0) })),

  s("h1", fmt('<h1 id="{}">{}</h1>', { i(1, "heading"), i(2, "heading") })),

  s("input", fmt('<input type="{}" name="{}" value="{}">{}', {
    i(1, "text"),
    i(2, "some_name"),
    i(3),
    i(0),
  })),

  s("link", fmt('<link rel="{}" href="{}" type="text/css" media="{}" charset="utf-8">{}', {
    i(1, "stylesheet"),
    i(2, "/css/master.css"),
    i(3, "screen"),
    i(0),
  })),

  s("mailto", fmt('<a href="mailto:{}?subject={}">{}</a>', {
    i(1, "joe@example.com"),
    i(2, "feedback"),
    i(3, "email me"),
  })),

  s("meta", fmt('<meta name="{}" content="{}">{}', { i(1, "name"), i(2, "content"), i(0) })),

  s("opt", fmt('<option value="{}">{}</option>{}', { i(1, "option"), i(2, "option"), i(0) })),

  s("select", fmt([[
<select name="{}" id="{}">
	<option value="{}">{}</option>
</select>{}]], { i(1, "some_name"), rep(1), i(2, "option"), rep(2), i(0) })),

  s("table", fmt([[
<table border="{}">
	<tr><th>{}</th></tr>
	<tr><td>{}</td></tr>
</table>{}]], { i(1, "0"), i(2, "Header"), i(3, "Data"), i(0) })),

  s("textarea", fmt('<textarea name="{}" rows="{}" cols="{}">{}</textarea>{}', {
    i(1, "Name"),
    i(2, "8"),
    i(3, "40"),
    i(4),
    i(0),
  })),

  s("fieldset", fmt([[
<fieldset id="{}">
	<legend>{}</legend>

	{}
</fieldset>]], { i(1, "name"), rep(1), i(0) })),

  s("label", {
    t('<label for="'),
    i(1, "id"),
    t('">'),
    i(2, "name"),
    t('</label><input type="'),
    i(3, "text"),
    t('" name="'),
    rep(1),
    t('" value="'),
    i(4),
    t('" id="'),
    rep(1),
    t('">'),
    i(0),
  }),
}
