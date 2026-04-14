return {
  settings = {
    latex = {
      build = {
        executable = "pdflatex",
        onSave = true,
        args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
      },
      forwardSearch = {
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
}
