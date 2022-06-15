require("qf_helper").setup()

vim.keymap.set("n", "<leader>cl", "<cmd>QFToggle!<CR>")
vim.keymap.set("n", "<leader>ll", "<cmd>LLToggle!<CR>")
vim.keymap.set("n", "[q", "<cmd>QFPrev<CR>", { silent = true })
vim.keymap.set("n", "]q", "<cmd>QFNext<CR>", { silent = true })
vim.keymap.set("n", "[l", "<cmd>LLPrev<CR>", { silent = true })
vim.keymap.set("n", "]l", "<cmd>LLNext<CR>", { silent = true })
