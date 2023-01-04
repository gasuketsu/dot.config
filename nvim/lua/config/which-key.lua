local wk = require("which-key")

wk.setup()

wk.register({
  {
    prefix = "<leader>",
    f = {
      name = "find",
      b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
      f = { "<cmd>Telescope find_files<cr>", "Find files" },
      g = { "<cmd>Telescope git_files<cr>", "Find git files" },
      G = { "<cmd>Telescope live_grep<cr>", "Find with live grep" },
      h = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
      n = { "<cmd>Telescope notify<cr>", "Find notify" },
    },
    t = {
      name = "toggle",
      e = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer" },
      l = { "<cmd>LLToggle!<cr>", "Toggle loclist" },
      q = { "<cmd>QFToggle!<cr>", "Toggle quickfix" },
      x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    },
    w = {
      name = "whitespace",
      t = { "<cmd>RetrailTrimWhitespace<cr>", "Trim whitespace" },
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
  },
  {
    ["["] = {
      name = "prev",
      l = { "<cmd>LLPrev<cr>", "Prev loclist" },
      q = { "<cmd>QFPrev<cr>", "Prev quickfix" },
    },
    ["]"] = {
      name = "next",
      l = { "<cmd>LLNext<cr>", "Next loclist" },
      q = { "<cmd>QFNext<cr>", "Next quickfix" },
    },
  },
})
