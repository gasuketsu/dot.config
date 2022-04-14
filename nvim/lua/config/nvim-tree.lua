require("nvim-tree").setup({
  view = {
    auto_resize = true,
    mappings = {
      { key = "g?", action = "" },
      { key = "?", action = "toggle_help" },
    },
  },
})
