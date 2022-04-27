local wezterm = require("wezterm")

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell",
    args = { "powershell.exe", "-NoLogo" },
  })
end

return {
  initial_rows = 32,
  initial_cols = 130,

  default_prog = { "wsl", "~" },
  launch_menu = launch_menu,

  font = wezterm.font("UDEV Gothic NF Regular"),
  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font("UDEV Gothic NF Bold"),
    },
    {
      italic = true,
      font = wezterm.font("UDEV Gothic NF Italic"),
    },
    {
      italic = true,
      intensity = "Bold",
      font = wezterm.font("UDEV Gothic NF Bold Italic"),
    },
  },
  font_size = 12,
  freetype_load_target = "Light",
  freetype_load_flags = "DEFAULT",
  window_background_opacity = 0.95,
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "Gruvbox",
  window_frame = {
    active_titlebar_bg = "#1d2021",
    inactive_titlebar_bg = "#1e2021",
  },
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#3c3836",
        fg_color = "#fbf1c7",
      },
      inactive_tab = {
        bg_color = "#282828",
        fg_color = "#a89984",
      },
    },
  },
  audible_bell = "Disabled",
  color_schemes = {
    ["Gruvbox"] = {
      background = "#1d2021",
      foreground = "#bdae93",
      cursor_bg = "#fe8019",
      cursor_border = "#fe8019",
      compose_cursor = "#f9f1c7",
      selection_bg = "#928374",
      split = "#fbf1c7",
      ansi = {
        "#504945", -- Black
        "#cc241d", -- Red
        "#98971a", -- Green
        "#d79921", -- Yellow
        "#458588", -- Blue
        "#b16286", -- Purple
        "#689d6a", -- Cyan
        "#ebdbb2", -- White
      },
      brights = {
        "#665c54", -- BrightBlack
        "#fb4934", -- BrightRed
        "#b8bb26", -- BrightGreen
        "#fabd2f", -- BrightYellow
        "#83a598", -- BrightBlue
        "#d3869b", -- BrightPurple
        "#8ec07c", -- BrightCyan
        "#fbf1c7", -- BrightWhite
      },
    },
    ["Gruvbox-Material(Mix)"] = {
      background = "#1d2021",
      foreground = "#bdae93",
      cursor_bg = "#f28534",
      cursor_border = "#f28534",
      compose_cursor = "#f9f5d7",
      selection_bg = "#928374",
      split = "#fbf1c7",
      ansi = {
        "#504945", -- Black
        "#f2594b", -- Red
        "#b0b846", -- Green
        "#e9b143", -- Yellow
        "#80aa9e", -- Blue
        "#d3869b", -- Purple
        "#8bba7f", -- Cyan
        "#ebdbb2", -- White
      },
      brights = {
        "#665c54", -- BrightBlack
        "#f2594b", -- BrightRed
        "#b0b846", -- BrightGreen
        "#e9b143", -- BrightYellow
        "#80aa9e", -- BrightBlue
        "#d3869b", -- BrightPurple
        "#8bba7f", -- BrightCyan
        "#f9f5d7", -- BrightWhite
      },
    },
  },
  keys = {
    {
      key = "w",
      mods = "ALT|SHIFT",
      action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
    {
      key = "l",
      mods = "ALT|SHIFT",
      action = "ShowLauncher",
    },
  },
}
