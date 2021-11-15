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
          added = { fg = '#b8bb26' },
          modified = { fg = '#83a598' },
          removed = { fg = '#fb4934' },
        }
      },
      {
        'diagnostics',
        colored = true,
        diagnostics_color = {
          error = { fg = '#fb4934' },
          warn = { fg = '#fe8019' },
          info = { fg = '#8ec07c' },
          hint = { fg = '#83a598' },
        },
        sources = {'coc'}
      },
    },
  },
}
