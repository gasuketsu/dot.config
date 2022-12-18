require("whitespace-nvim").setup()

vim.keymap.set("n", "<leader>W", require("whitespace-nvim").trim)
