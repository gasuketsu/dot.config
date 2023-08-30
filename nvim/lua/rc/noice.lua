require("noice").setup({
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  cmdline = {
    view = "cmdline",
  },
  popupmenu = {
    backend = "cmp",
  },
  notify = {
    backend = "mini",
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = {
      enabled = false,
    },
    presets = {
      lsp_doc_border = true,
    },
  },
  views = {
    mini = {
      align = "message-left",
      position = {
        row = -2,
        col = "100%",
      },
      size = {
        width = "40%",
        height = "auto",
        max_height = 8,
      },
      win_options = {
        winblend = 10,
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "NormalFloat",
        },
      },
      border = {
        style = "rounded",
      },
    },
  },
})

require("telescope").load_extension("noice")
