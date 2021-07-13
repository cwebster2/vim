return {
  lintCommand = "docker run --rm -i hadolint/hadolint hadolint --no-color -",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l %m","%f:%l:%c: %m"},
}
