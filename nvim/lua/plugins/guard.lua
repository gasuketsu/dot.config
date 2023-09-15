return {
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      local ft = require("guard.filetype")

      ft("c,cpp"):fmt("clang-format")
      ft("css"):fmt("prettier")
      ft("fish"):fmt("fish_indent")
      ft("go"):fmt("lsp")
      ft("html"):fmt("prettier")
      ft("javascript,typescript,typescriptreact"):fmt("prettier")
      ft("json"):fmt("prettier")
      ft("lua"):fmt("stylua")
      ft("markdown"):fmt("prettier")
      ft("python"):fmt("black")
      ft("rust"):fmt("rustfmt")
      ft("sh"):fmt("shfmt")
      ft("yaml"):fmt("prettier")

      require("guard").setup({
        fmt_on_save = false,
        lsp_as_default_formatter = true,
      })
    end,
  },
}
