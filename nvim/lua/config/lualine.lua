-- statusline (lualine)
local get_color = require"lualine.utils.utils".extract_highlight_colors

require "lualine".setup {
  options = {
    theme = "gruvbox-material",
  },
  sections = {
    lualine_b = {
      {"branch"},
      {
        "diff",
        colored = true,
        diff_color = {
          added = {fg = get_color("GitSignsAdd", "fg")},
          modified = {fg = get_color("GitSignsChange", "fg")},
          removed = {fg = get_color("GitSignsDelete", "fg")},
        }
      },
      {
        "diagnostics",
        colored = true,
        diagnostics_color = {
          error = {fg = get_color("DiagnosticSignError", "fg")},
          warn = {fg = get_color("DiagnosticSignWarning", "fg")},
          info = {fg = get_color("DiagnosticSignInfo", "fg")},
          hint = {fg = get_color("DiagnosticSignHint", "fg")},
        },
        sources = {"coc"}
      },
    },
  },
}