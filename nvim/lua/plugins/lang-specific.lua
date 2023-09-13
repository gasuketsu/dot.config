return {
  -- python
  {
    "Vimjas/vim-python-pep8-indent",
  },
  -- golang
  {
    "ray-x/go.nvim",
    dependencies = {
      { "ray-x/guihua.lua" },
      { "neovim/nvim-lspconfig" },
      { "nvim-treesitter/nvim-treesitter" },
      { "mfussenegger/nvim-dap" },
      { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
      require("go").setup({
        lsp_gofumpt = true,
        lsp_codelens = false,
      })
    end,
  },
}
