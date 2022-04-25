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

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fG", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true })
