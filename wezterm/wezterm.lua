local wezterm = require("wezterm")

return {
  initial_rows = 40,
  initial_cols = 180,

  default_prog = { "wsl", "~" },
  font = wezterm.font_with_fallback({ "PlemolJP Console NF" }),
  window_background_opacity = 0.95,
  color_scheme = "Gruvbox",
  color_schemes = {
    ["Gruvbox"] = {
      background = "#282828",
      foreground = "#BDAE93",
      cursor_bg = "#FE8019",
      cursor_border = "#FE8019",
      selection_bg = "#928374",
      split = "#FBF1C7",
      ansi = {
        "#3C3836", -- Black
        "#CC241D", -- Red
        "#98971A", -- Green
        "#D79921", -- Yellow
        "#458588", -- Blue
        "#B16286", -- Purple
        "#689D6A", -- Cyan
        "#EBDBB2", -- White
      },
      brights = {
        "#504945", -- BrightBlack
        "#FB4934", -- BrightRed
        "#B8BB26", -- BrightGreen
        "#FABD2F", -- BrightYellow
        "#83A598", -- BrightBlue
        "#D3869B", -- BrightPurple
        "#8EC07C", -- BrightCyan
        "#FBF1C7", -- BrightWhite
      },
    },
  },
}
