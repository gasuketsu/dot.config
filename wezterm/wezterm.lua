local wezterm = require("wezterm")
local act = wezterm.action

local launch_menu = {}
local font_family = "UDEV Gothic NF"

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell",
    args = { "pwsh.exe" },
  })
end

return {
  initial_rows = 32,
  initial_cols = 130,

  default_prog = { "wsl", "~" },
  launch_menu = launch_menu,

  ime_preedit_rendering = "System",
  font = wezterm.font({ family = font_family }),
  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font({ family = font_family, weight = "Bold" }),
    },
    {
      italic = true,
      font = wezterm.font({ family = font_family, style = "Italic" }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = wezterm.font({ family = font_family, weight = "Bold", style = "Italic" }),
    },
  },
  font_size = 12,
  freetype_load_target = "Normal",
  freetype_load_flags = "DEFAULT",
  window_background_opacity = 0.95,
  text_background_opacity = 0.95,
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "Kanagawa",
  window_frame = {
    active_titlebar_bg = "#181616",
    inactive_titlebar_bg = "#181616",
  },
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#282727",
        fg_color = "#dcd7ba",
      },
      inactive_tab = {
        bg_color = "#0d0c0c",
        fg_color = "#a7ac9c",
      },
    },
  },
  audible_bell = "Disabled",
  color_schemes = {
    ["Gruvbox-Mix"] = {
      background = "#282828",
      foreground = "#c0ac8d",
      cursor_bg = "#f28534",
      cursor_border = "#f28534",
      compose_cursor = "#f2e5bc",
      selection_bg = "#928374",
      split = "#f2e5bc",
      ansi = {
        "#32302f", -- Black
        "#cd4538", -- Red
        "#959c36", -- Green
        "#c69431", -- Yellow
        "#6b9085", -- Blue
        "#b36e81", -- Purple
        "#749e69", -- Cyan
        "#e5d5ad", -- White
      },
      brights = {
        "#45403d", -- BrightBlack
        "#f2594b", -- BrightRed
        "#b0b846", -- BrightGreen
        "#e9b143", -- BrightYellow
        "#80aa9e", -- BrightBlue
        "#d3869b", -- BrightPurple
        "#8bba7f", -- BrightCyan
        "#f4e8be", -- BrightWhite
      },
    },
    ["Kanagawa"] = {
      foreground = "#a7ac9c",
      background = "#181616",
      cursor_bg = "#ffa066",
      cursor_border = "#ffa066",
      selection_bg = "#2d4f67",
      scrollbar_thumb = "#393836",
      split = "#727169",
      ansi = {
        "#181616", -- Black
        "#c34043", -- Red
        "#6f894e", -- Green
        "#dca561", -- Yellow
        "#4d699b", -- Blue
        "#766b90", -- Purple
        "#6a9589", -- Cyan
        "#dcd7ba", -- White
      },
      brights = {
        "#625e5a", -- BrightBlack
        "#ff5d62", -- BrightRed
        "#98bb6c", -- BrightGreen
        "#e6c384", -- BrightYellow
        "#7fb4ca", -- BrightBlue
        "#938aa9", -- BrightPurple
        "#7aa89f", -- BrightCyan
        "#f2ecbc", -- BrightWhite
      },
      indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
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
    {
      key = "l",
      mods = "CTRL|ALT",
      action = act.SendKey({ key = "l", mods = "CTRL|ALT" }),
    },
    {
      key = "f",
      mods = "CTRL|ALT",
      action = act.SendKey({ key = "f", mods = "CTRL|ALT" }),
    },
    {
      key = "|",
      mods = "CTRL|ALT|SHIFT",
      action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
      key = "_",
      mods = "CTRL|ALT|SHIFT",
      action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
      key = "%",
      mods = "CTRL|ALT|SHIFT",
      action = act.SendKey({ key = "%", mods = "CTRL|ALT" }),
    },
    {
      key = '"',
      mods = "CTRL|ALT|SHIFT",
      action = act.SendKey({ key = '"', mods = "CTRL|ALT" }),
    },
  },
}
