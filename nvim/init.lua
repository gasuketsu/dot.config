local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
vim.g.mapleader = " "

require("plugins")

require("rc.base")

require("rc.colorscheme")
require("rc.lualine")
require("rc.bufferline")
require("rc.qf_helper")
require("rc.nvim-bqf")
require("rc.project")
require("rc.nvim-tree")
require("rc.indent-blankline")
require("rc.guard")
require("rc.retrail")
require("rc.surround")
require("rc.recorder")
require("rc.neogit")
require("rc.gitsigns")
require("rc.diffview")
require("rc.telescope")
require("rc.nvim-treesitter")
require("rc.comment")
require("rc.trouble")
require("rc.toggleterm")
require("rc.noice")
require("rc.dressing")
require("rc.go")
require("rc.mason")
require("rc.lsp")
require("rc.completion")
require("rc.which-key")
