return {
  {
    "zakharykaplan/nvim-retrail",
    config = function()
      require("retrail").setup({
        hlgroup = "DiffDelete",
        trim = {
          auto = false,
          whitespace = true,
          blanklines = true,
        },
      })
    end,
  },
}
