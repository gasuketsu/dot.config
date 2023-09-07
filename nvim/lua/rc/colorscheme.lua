vim.opt.termguicolors = true

require("kanagawa").setup({
  keywordStyle = { italic = false },
  terminalColors = false,
  theme = "wave",
  background = {
    dark = "wave",
    light = "lotus",
  },
})
vim.g.kanagawa_lualine_bold = true

vim.cmd("colorscheme kanagawa")
