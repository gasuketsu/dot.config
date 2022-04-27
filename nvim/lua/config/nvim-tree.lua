require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "g?", action = "" },
        { key = "?", action = "toggle_help" },
      },
    },
  },
})

vim.keymap.set("n", "<leader>et", "<Cmd>NvimTreeToggle<CR>")
