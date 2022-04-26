require("bufferline").setup({
  highlights = {
    buffer_selected = {
      gui = "bold",
    },
  },
})

vim.keymap.set("n", "<A-.>", "<cmd>BufferLineCycleNext<CR>)", { silent = true })
vim.keymap.set("n", "<A-,>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
