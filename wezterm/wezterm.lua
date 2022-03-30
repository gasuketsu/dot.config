local wezterm = require("wezterm")

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell",
    args = { "powershell.exe", "-NoLogo" },
  })

  -- Enumerate any WSL distributions that are installed and add those to the menu
  local success, wsl_list, wsl_err = wezterm.run_child_process({ "wsl.exe", "-l" })
  -- `wsl.exe -l` has a bug where it always outputs utf16:
  -- https://github.com/microsoft/WSL/issues/4607
  -- So we get to convert it
  wsl_list = wezterm.utf16_to_utf8(wsl_list)

  for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
    -- Skip the first line of output; it's just a header
    if idx > 1 then
      -- Remove the "(Default)" marker from the default line to arrive
      -- at the distribution name on its own
      local distro = line:gsub(" %(既定%)", "")

      -- Add an entry that will spawn into the distro with the default shell
      table.insert(launch_menu, {
        label = distro,
        args = { "wsl.exe", "--distribution", distro },
      })
    end
  end
end

return {
  initial_rows = 32,
  initial_cols = 130,

  default_prog = { "wsl", "~" },
  launch_menu = launch_menu,

  font = wezterm.font_with_fallback({ "PlemolJP Console NF" }),
  font_size = 12.5,
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
  },
}
