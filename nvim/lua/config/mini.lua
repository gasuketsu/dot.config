require("mini.comment").setup()
require("mini.trailspace").setup()
require("mini.surround").setup()

vim.keymap.set("n", "<A-t>", "<cmd>lua MiniTrailspace.trim()<CR>", { silent = true })
