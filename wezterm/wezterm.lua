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
  initial_rows = 40,
  initial_cols = 180,

  default_prog = { "wsl", "~" },
  launch_menu = launch_menu,

  font = wezterm.font_with_fallback({ "PlemolJP Console NF" }),
  font_size = 12,
  freetype_load_target = "Light",
  freetype_load_flag = "DEFAULT",
  window_background_opacity = 0.95,
  adjust_window_size_when_changing_font_size = false,
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
  keys = {
    {
      key = "w",
      mods = "ALT|SHIFT",
      action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
  },
}
