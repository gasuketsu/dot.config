-- statusline (lualine)
require 'lualine'.setup {
  options = {
    theme = 'gruvbox-material',
  },
  sections = {
    lualine_b = {
      {'branch'},
      {'diff', colored = false},
      {'diagnostics', colored = false, sources = {'coc'}},
    },
  },
}
