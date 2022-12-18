require("retrail").setup({
  hlgroup = "DiffDelete",
  trim = {
    auto = false,
    whitespace = true,
    blanklines = true,
  },
})

vim.keymap.set("n", "<leader>W", "<Cmd>RetrailTrimWhitespace<CR>")
