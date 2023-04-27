require("lazy").setup({
  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "akinsho/bufferline.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  "stevearc/qf_helper.nvim",
  "kevinhwang91/nvim-bqf",
  "gpanders/editorconfig.nvim",
  "numToStr/Comment.nvim",
  "kylechui/nvim-surround",
  "chrisgrieser/nvim-recorder",
  { "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
  "zakharykaplan/nvim-retrail",
  "lewis6991/gitsigns.nvim",
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  "ahmedkhalf/project.nvim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "HiPhish/nvim-ts-rainbow2", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "folke/trouble.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "folke/which-key.nvim" },
  { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  { "mhartington/formatter.nvim" },
  -- Language specific
  "Vimjas/vim-python-pep8-indent",
  {
    "crispgm/nvim-go",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "ray-x/lsp_signature.nvim",
  "onsails/lspkind-nvim",
  "folke/lsp-colors.nvim",
  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  -- Statusline
  "nvim-lualine/lualine.nvim",
  -- ColorSchemes
  "sainnhe/gruvbox-material",
  "sainnhe/everforest",
})
