require("nvim-tree").setup({
	view = {
		auto_resize = true,
    auto_close = true,
	},
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>et", [[<Cmd>NvimTreeToggle<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>ef", [[<Cmd>NvimTreeFindFileToggle<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>er", [[<Cmd>NvimTreeRefresh<CR>]], opts)
