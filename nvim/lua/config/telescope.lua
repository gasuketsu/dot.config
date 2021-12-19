local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["d"] = actions.delete_buffer,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})
