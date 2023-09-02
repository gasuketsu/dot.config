vim.opt.termguicolors = true

require("kanagawa").setup({
  compile = false,
  keywordStyle = { italic = false },
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "lotus",
  },
})

vim.cmd("colorscheme kanagawa")
