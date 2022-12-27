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
    "python",
    "regex",
    "rust",
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
  },
})

vim.api.nvim_create_augroup( 'TSRainbowRefresh', {} )
vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
  group = "TSRainbowRefresh",
  command = "TSDisable rainbow | TSEnable rainbow",
})
