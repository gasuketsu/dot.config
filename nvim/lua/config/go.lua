require("go").setup({
  notify = true,
  auto_format = false,
  auto_lint = false,
  formatter = "gofumpt",
  tags_transform = "camelcase",
})
