require("go").setup({
  auto_lint = false,
  formatter = "lsp",
  tags_options = {},
})

-- Treat *.mod files as gomod file
vim.api.nvim_clear_autocmds({
  event = { "BufRead", "BufNewFile" },
  pattern = { "*.mod", "*.MOD" },
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.mod", "*.MOD" },
  command = "set filetype=gomod",
})
