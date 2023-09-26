return {
  {
    "folke/which-key.nvim",
    dependencies = {
      { "stevearc/conform.nvim" },
    },
    config = function()
      local wk = require("which-key")
      wk.setup()
      -- normal mode keymaps with <leader>
      wk.register({
        f = {
          name = "find",
          D = { "<cmd>Telescope lsp_definitions<cr>", "Find definitions" },
          G = { "<cmd>Telescope live_grep<cr>", "Find with live grep" },
          R = { "<cmd>Telescope lsp_references<cr>", "Find references" },
          b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
          d = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
          f = { "<cmd>Telescope find_files<cr>", "Find files" },
          g = { "<cmd>Telescope git_files<cr>", "Find git files" },
          h = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
          n = { "<cmd>Telescope noice<cr>", "Find noice message history" },
          p = { "<cmd>Telescope projects<cr>", "Find projects" },
        },
        g = {
          name = "git",
          b = { "<cmd>Gitsigns blame_line<cr>", "Blame current line" },
          d = {
            name = "diff",
            i = { "<cmd>Gitsigns diffthis<cr>", "View diff from index" },
            h = { "<cmd>Gitsigns diffthis HEAD<cr>", "View diff from HEAD" },
          },
          g = { "<cmd>Neogit<cr>", "Open Neogit" },
          h = {
            name = "hunk",
            R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset hunks in buffer" },
            S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage hunks in buffer" },
            p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
            r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
            s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
            u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo last stage" },
          },
          t = {
            name = "toggle",
            b = { "<cmd>Gitsigns toggle_current_line<cr>", "Toggle current line blame" },
            d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted" },
          },
          v = {
            name = "diffView",
            c = { "<cmd>DiffviewClose<cr>", "Close DiffView" },
            o = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
            r = { "<cmd>DiffviewRefresh<cr>", "Refresh DiffView" },
            t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle DiffView file tree" },
          },
        },
        l = {
          name = "lsp",
          D = { "<cmd>Telescope lsp_definitions<cr>", "Find definitions" },
          R = { "<cmd>Telescope lsp_references<cr>", "Find references" },
          S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Find symbols in workspace" },
          a = { vim.lsp.buf.code_action, "Code Action" },
          d = { vim.lsp.buf.type_definition, "Display type Definition" },
          e = { vim.diagnostic.open_float, "Show diagnostics in floating window" },
          l = { vim.lsp.codelens.run, "Run CodeLens action" },
          o = { "<cmd>SymbolsOutline<cr>", "Toggle Symbol Outline" },
          r = { vim.lsp.buf.rename, "Rename symbol" },
          q = { vim.diagnostic.setqflist, "Add all diagnostics to quickfix list" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols in current buffer" },
        },
        s = {
          name = "treesitter",
          c = {
            name = "context",
            d = { "<cmd>TSContextDisable<cr>", "Disable treesitter context" },
            e = { "<cmd>TSContextEnable<cr>", "Enable treesitter context" },
            t = { "<cmd>TSContextToggle<cr>", "Toggle treesitter context" },
          },
          u = { "<cmd>TSUpdate<cr>", "Update treesitter parsers" },
        },
        t = {
          name = "toggle",
          e = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer" },
          l = { "<cmd>LLToggle!<cr>", "Toggle loclist" },
          q = { "<cmd>QFToggle!<cr>", "Toggle quickfix" },
          t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
          x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
        },
        w = {
          name = "whitespace",
          x = { "<cmd>RetrailTrimWhitespace<cr>", "Trim whitespace" },
        },
        x = {
          name = "trouble",
          d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics" },
          l = { "<cmd>Trouble loclist<cr>", "Trouble loclist" },
          q = { "<cmd>Trouble quickfix<cr>", "Trouble quickfix" },
          r = { "<cmd>Trouble lsp_references<cr>", "Trouble lsp_references" },
          t = { "<cmd>TroubleToggle<cr>", "Trouble toggle" },
          w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace_diagnostics" },
        },
      }, { prefix = "<leader>" })
      -- normal mode keymaps without <leader>
      wk.register({
        K = { vim.lsp.buf.hover, "Display hover info" },
        Y = { "y$", "Yank to end of the line" },
        g = {
          name = "goto/comments",
          D = { vim.lsp.buf.declaration, "Go to decleration" },
          i = { vim.lsp.buf.implementation, "Go to implementation" },
          h = { vim.lsp.buf.signature_help, "Go to signature help" },
        },
        ["["] = {
          name = "prev",
          c = { "<cmd>Gitsign prev_hunk<cr>", "Prev git hunk" },
          d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
          l = { "<cmd>LLPrev<cr>", "Prev loclist" },
          q = { "<cmd>QFPrev<cr>", "Prev quickfix" },
        },
        ["]"] = {
          name = "next",
          c = { "<cmd>Gitsign next_hunk<cr>", "Next git hunk" },
          d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
          l = { "<cmd>LLNext<cr>", "Next loclist" },
          q = { "<cmd>QFNext<cr>", "Next quickfix" },
        },
        ["<M-f>"] = {
          function()
            require("conform").format({
              lsp_fallback = true,
            })
          end,
          "Format file",
        },
        ["<M-[>"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
        ["<M-]>"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
        ["<C-l>"] = { "<cmd>nohl<cr>", "Clear highlight" },
      })
      -- visual mode mappings with <leader>
      wk.register({
        g = {
          name = "git",
          h = {
            name = "hunk",
            r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
            s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
          },
        },
      }, {
        mode = "v",
        prefix = "<leader>",
      })
    end,
  },
}
