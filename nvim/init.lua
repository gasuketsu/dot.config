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
require("rc.colorscheme")

-- Provider configuration
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/py3nvim/.venv/bin/python")
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Display configuration
vim.opt.shortmess:append({ c = true, I = true })
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,euc-jp,sjis,cp932,iso-2022-jp"
vim.opt.listchars = "tab:> ,trail:·,nbsp:+"

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.list = true
vim.opt.ambiwidth = "single"

vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.display = "lastline"
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- Editor configuration
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.viminfo = ""
vim.opt.undofile = false

-- enable to open other file in edit
vim.opt.hidden = true

-- wildmode(complement)
vim.opt.wildmode = "list:longest"
vim.opt.wildignore:append({
  "*.o",
  "*.obj",
  "*.a",
  "*.pyc",
  "*.DS_Store",
  "*.db",
  "*/tmp/*",
  "*.swp",
  "*.zip",
  "*.exe",
  "*.dll",
  "*.so",
  "NTUSER*",
  "ntuser*",
})

-- timeout
vim.opt.timeoutlen = 500

-- Default Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cindent = true
vim.opt.cino = "l1,:0,g0,(0,W4,m1"

-- Copy&Paste
vim.opt.clipboard = "unnamedplus"

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.inccommand = "split"

require("rc.lualine")
require("rc.bufferline")
require("rc.qf_helper")
require("rc.nvim-bqf")
require("rc.project")
require("rc.nvim-tree")
require("rc.indent-blankline")
require("rc.formatter")
require("rc.retrail")
require("rc.surround")
require("rc.recorder")
require("rc.neogit")
require("rc.gitsigns")
require("rc.diffview")
require("rc.telescope")
require("rc.nvim-treesitter")
require("rc.rainbow-delimiters")
require("rc.comment")
require("rc.trouble")
require("rc.noice")
require("rc.dressing")
require("rc.go")
require("rc.mason")
require("rc.lsp")
require("rc.completion")
require("rc.which-key")
