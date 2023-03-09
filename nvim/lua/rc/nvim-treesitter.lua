-- nvim-treesitter
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "go",
    "gomod",
    "help",
    "html",
    "java",
    "javascript",
    "json",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "rust",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "elixir" }, -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    hlgroups = {
      "Red",
      "Orange",
      "Yellow",
      "Green",
      "Aqua",
      "Blue",
      "Purple",
    },
    strategy = require("ts-rainbow.strategy.global"),
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

require("treesitter-context").setup()

vim.api.nvim_create_augroup("TSRainbowRefresh", {})
vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
  group = "TSRainbowRefresh",
  command = "TSDisable rainbow | TSEnable rainbow",
})
