require("plugins")

vim.opt.termguicolors = true

vim.g.gruvbox_material_palette = "mix"
vim.g.gruvbox_material_statusline_style = "mix"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox-material")

-- Provider configuration
vim.g.python3_host_prog = "$HOME.'/.config/nvim/py3nvim/.venv/bin/python'"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Display configuration
vim.opt.shortmess:append({ c = true, I = true })
vim.opt.shellslash = true
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,euc-jp,sjis,cp932,iso-2022-jp"

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
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.timeoutlen = 200

-- Default Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cindent = true
vim.opt.cino = "l1,:0,g0,(0,W4,m1"

-- Copy&Paste
vim.opt.clipboard = "unnamed"

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.inccommand = "split"

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")
-- turn off search highlighting until the next search
vim.keymap.set("n", "<C-l>", ":nohl<cr>", { silent = true })
-- change current directory when changing buffer
vim.keymap.set("n", "CD", "<cmd>lcd %:h<cr>", { silent = true })

vim.keymap.set({ "n", "v", "o" }, "q", "<Nop>", { remap = true })

-- NERDCommenter
vim.g.NERDDefaultAlign = "left"

-- Neoformat
vim.g.neoformat_try_formatprg = 1
vim.g.neoformat_enabled_go = { "gofumpt", "gofmt" }
vim.keymap.set("n", "<A-f>", "<cmd>Neoformat<CR>", { silent = true })

-- vim-qf
vim.keymap.set("n", "<leader>qq", "<Plug>(qf_qf_toggle)")
vim.keymap.set("n", "<leader>ql", "<Plug>(qf_loc_toggle)")
vim.keymap.set("n", "[q", "<Plug>(qf_qf_previous)", { silent = true })
vim.keymap.set("n", "]q", "<Plug>(qf_qf_next)", { silent = true })
vim.keymap.set("n", "[l", "<Plug>(qf_loc_previous)", { silent = true })
vim.keymap.set("n", "]l", "<Plug>(qf_loc_next)", { silent = true })

-- vim-better-whitespace
--  disable highlighting trailing whitespace by default.
--  (perform :ToggleWhitespace to enable highlighting)
vim.g.better_whitespace_guicolor = "#fb4934"
vim.g.better_whitespace_ctermcolor = 167
vim.keymap.set("n", "<leader>w", "<cmd>ToggleWhitespace<CR>", { silent = true })
vim.keymap.set("n", "<leader>sw", "<cmd>StripWhitespace<CR>", { silent = true })
vim.keymap.set("n", "<leader>sw", "<cmd>StripWhitespace<CR>", { silent = true })

-- multiple cursors
vim.g.multiple_cursor_use_default_mapping = 0
vim.g.multiple_cursor_next_key = "<C-n>"
vim.g.multiple_cursor_prev_key = "<C-h>"
vim.g.multiple_cursor_skip_key = "<C-x>"
vim.g.multiple_cursor_quit_key = "<Esc>"

require("config.lualine")
require("config.bufferline")
require("config.nvim-tree")
require("config.indent-blankline")
require("config.gitsigns")
require("config.diffview")
require("config.telescope")
require("config.nvim-treesitter")
require("config.go")
require("config.lsp")
require("config.completion")
