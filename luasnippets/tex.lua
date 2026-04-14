local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Use <> delimiters to avoid conflicts with LaTeX braces
local fmta = require("luasnip.extras.fmt").fmta

return {
  s("begin", fmta([[
\begin{<>}
	<>
\end{<>}]], { i(1, "env"), i(0), rep(1) })),

  s("tab", fmta([[
\begin{<>}{<>}
<>
\end{<>}]], { i(1, "tabular"), i(2, "c"), i(0), rep(1) })),

  s("ali", fmta([[
\begin{align<>}
	<>
\end{align<>}]], { i(1, "ed"), i(0), rep(1) })),

  s("gat", fmta([[
\begin{gather<>}
	<>
\end{gather<>}]], { i(1, "ed"), i(0), rep(1) })),

  s("eq", fmta([[
\begin{equation}
	<>
\end{equation}]], { i(0) })),

  s("\\", {
    t({ "\\[", "\t" }),
    i(0),
    t({ "", "\\]" }),
  }),

  s("enum", fmta([[
\begin{enumerate}
	\item <>
\end{enumerate}]], { i(0) })),

  s("item", fmta([[
\begin{itemize}
	\item <>
\end{itemize}]], { i(0) })),

  s("desc", fmta([[
\begin{description}
	\item[<>] <>
\end{description}]], { i(1), i(0) })),

  s("mat", fmta([[
\begin{<>matrix}
	<>
\end{<>matrix}]], { i(1, "p"), i(0), rep(1) })),

  s("cas", fmta([[
\begin{cases}
	<>, &\text{ if }<>\\
	<>
\end{cases}]], { i(1, "equation"), i(2, "case"), i(0) })),

  s("spl", fmta([[
\begin{split}
	<>
\end{split}]], { i(0) })),

  -- Sections with labels
  s("partl", fmta([[
\part{<>}
\label{prt:<>}
<>]], { i(1, "part name"), rep(1), i(0) })),

  s("chal", fmta([[
\chapter{<>}
\label{cha:<>}
<>]], { i(1, "chapter name"), rep(1), i(0) })),

  s("secl", fmta([[
\section{<>}
\label{sec:<>}
<>]], { i(1, "section name"), rep(1), i(0) })),

  s("subl", fmta([[
\subsection{<>}
\label{sub:<>}
<>]], { i(1, "subsection name"), rep(1), i(0) })),

  s("subsl", fmta([[
\subsubsection{<>}
\label{ssub:<>}
<>]], { i(1, "subsubsection name"), rep(1), i(0) })),

  s("parl", fmta([[
\paragraph{<>}
\label{par:<>}
<>]], { i(1, "paragraph name"), rep(1), i(0) })),

  s("subpl", fmta([[
\subparagraph{<>}
\label{subp:<>}
<>]], { i(1, "subparagraph name"), rep(1), i(0) })),

  -- Sections without labels
  s("part", fmta([[\part{<>}]], { i(1, "part name") })),
  s("cha", fmta([[\chapter{<>}]], { i(1, "chapter name") })),
  s("sec", fmta([[\section{<>}]], { i(1, "section name") })),
  s("sub", fmta([[\subsection{<>}]], { i(1, "subsection name") })),
  s("ssub", fmta([[\subsubsection{<>}]], { i(1, "subsubsection name") })),
  s("par", fmta([[\paragraph{<>}]], { i(1, "paragraph name") })),
  s("subp", fmta([[\subparagraph{<>}]], { i(1, "subparagraph name") })),

  -- Items
  s("it", fmta([[\item <>]], { i(0) })),
  s("itd", fmta([[\item[<>] <>]], { i(1, "description"), i(0) })),

  -- References
  s("figure", fmta([[<>~\ref{<>}<>]], { i(1, "Figure"), i(2, "fig:"), i(0) })),
  s("table", fmta([[<>~\ref{<>}<>]], { i(1, "Table"), i(2, "tab:"), i(0) })),
  s("listing", fmta([[<>~\ref{<>}<>]], { i(1, "Listing"), i(2, "list"), i(0) })),
  s("section", fmta([[<>~\ref{<>}<>]], { i(1, "Section"), i(2, "sec:"), i(0) })),
  s("page", fmta([[<>~\pageref{<>}<>]], { i(1, "page"), i(2), i(0) })),

  -- Math
  s("fr", fmta([[\frac{<>}{<>}]], { i(1), i(2) })),

  -- Verbatim
  s("ver", fmta([[
\begin{verbatim}
<>
\end{verbatim}]], { i(0) })),
}
