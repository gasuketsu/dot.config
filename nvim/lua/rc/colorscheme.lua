vim.opt.termguicolors = true

require("nightfox").setup({
  options = {
    styles = {
      comments = "italic",
      types = "bold",
    },
  },
})

vim.cmd("colorscheme nordfox")
