-- statusline (lualine)
require 'lualine'.setup {
  options = {
    theme = 'gruvbox-material',
  },
  sections = {
    lualine_b = {
      {'branch'},
      {
        'diff',
        colored = true,
        diff_color = {
          added = { fg = '#b0b846' },
          modified = { fg = '#80aa9e' },
          removed = { fg = '#f2594b' },
        }
      },
      {
        'diagnostics',
        colored = true,
        diagnostics_color = {
          error = { fg = '#f2594b' },
          warn = { fg = '#f28534' },
          info = { fg = '#8bba7f' },
          hint = { fg = '#80aa9e' },
        },
        sources = {'coc'}
      },
    },
  },
}
