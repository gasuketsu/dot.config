require("project_nvim").setup()

require("telescope").load_extension("projects")

vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { silent = true })
