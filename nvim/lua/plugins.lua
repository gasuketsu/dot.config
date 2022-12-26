return require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use("stevearc/qf_helper.nvim")
  use("kevinhwang91/nvim-bqf")
  use("gpanders/editorconfig.nvim")
  use("numToStr/Comment.nvim")
  use("kylechui/nvim-surround")
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use("zakharykaplan/nvim-retrail")
  use("lewis6991/gitsigns.nvim")
  use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("ahmedkhalf/project.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use({ "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } })
  use({ "folke/trouble.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "mhartington/formatter.nvim" })
  -- Language specific
  use("Vimjas/vim-python-pep8-indent")
  use({
    "olexsmir/gopher.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
  })
  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("ray-x/lsp_signature.nvim")
  use("onsails/lspkind-nvim")
  use("folke/lsp-colors.nvim")
  -- Completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use({ "saadparwaiz1/cmp_luasnip", requires = { "L3MON4D3/LuaSnip" } })
  use({ "tzachar/cmp-tabnine", run = "./install.sh" })
  -- Statusline
  use("nvim-lualine/lualine.nvim")
  -- ColorSchemes
  use("sainnhe/gruvbox-material")
  use("sainnhe/everforest")
end)
