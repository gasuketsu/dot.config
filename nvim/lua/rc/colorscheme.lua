vim.opt.termguicolors = true

require("nightfox").setup({
  options = {
    styles = {
      comments = "italic",
      types = "bold",
    },
  },
})

require("kanagawa").setup({
  keywordStyle = { italic = false },
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "lotus",
  },
})
vim.g.kanagawa_lualine_bold = true

vim.cmd("colorscheme kanagawa")
