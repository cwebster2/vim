return {
  lintCommand = "docker run --rm -i hadolint/hadolint",
  lintStdin = true,
  lintFormar = '%f:%l:%c %m'
}
