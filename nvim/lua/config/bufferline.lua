require("bufferline").setup()

local function buf_set_keymap(...)
	vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "]b", [[<Cmd>BufferLineCycleNext<CR>]], opts)
vim.api.nvim_set_keymap("n", "[b", [[<Cmd>BufferLineCyclePrev<CR>]], opts)
