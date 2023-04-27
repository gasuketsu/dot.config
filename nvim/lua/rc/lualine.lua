-- statusline (lualine)
local get_color = require("lualine.utils.utils").extract_highlight_colors

require("lualine").setup({
  options = {
    theme = "gruvbox-material",
    refresh = {
      statusline = 500,
    },
  },
  sections = {
    lualine_b = {
      { "branch" },
      {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = get_color("GitSignsAdd", "fg") },
          modified = { fg = get_color("GitSignsChange", "fg") },
          removed = { fg = get_color("GitSignsDelete", "fg") },
        },
      },
      {
        "diagnostics",
        colored = true,
        diagnostics_color = {
          error = { fg = get_color("DiagnosticSignError", "fg") },
          warn = { fg = get_color("DiagnosticSignWarn", "fg") },
          info = { fg = get_color("DiagnosticSignInfo", "fg") },
          hint = { fg = get_color("DiagnosticSignHint", "fg") },
        },
        sources = { "nvim_lsp" },
      },
    },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
      },
      "encoding",
      "fileformat",
      "filetype",
    },
  },
})
