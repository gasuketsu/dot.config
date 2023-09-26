return {
  -- python
  {
    "Vimjas/vim-python-pep8-indent",
  },
  -- golang
  {
    "crispgm/nvim-go",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("go").setup({
        auto_format = false,
      })
      vim.api.nvim_clear_autocmds({
        event = { "BufRead", "BufNewFile" },
        pattern = { "*.mod", "*.MOD" },
      })
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.mod", "*.MOD" },
        callback = function(ev)
          vim.cmd("set filetype=gomod")
        end,
      })
    end,
  },
}
