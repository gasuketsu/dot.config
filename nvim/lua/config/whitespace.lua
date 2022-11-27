require("whitespace-nvim").setup()

vim.keymap.set("n", "<leader>T", require("whitespace-nvim").trim)
