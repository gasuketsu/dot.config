require("bufferline").setup({
  highlights = {
    buffer_selected = {
      bold = true,
      italic = false,
    },
  },
})

vim.keymap.set("n", "<A-]>", "<cmd>BufferLineCycleNext<CR>)", { silent = true })
vim.keymap.set("n", "<A-[>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
