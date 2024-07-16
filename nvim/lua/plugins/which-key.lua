return {
    {
        "folke/which-key.nvim",
        dependencies = {
            { "stevearc/conform.nvim" },
            { "nvim-neotest/neotest" },
            { "echasnovski/mini.icons", version = false },
        },
        config = function()
            local wk = require("which-key")
            local conform = require("conform")
            local neotest = require("neotest")
            -- normal mode keymaps with <leader>
            wk.add({
                -- group "toggle'
                { "<leader><space>", group = "toggle" },
                { "<leader><space>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
                { "<leader><space>l", "<cmd>LLToggle!<cr>", desc = "Toggle loclist" },
                { "<leader><space>o", "<cmd>AerialToggle!<cr>", desc = "Toggle outline" },
                { "<leader><space>q", "<cmd>QFToggle!<cr>", desc = "Toggle quickfix" },
                { "<leader><space>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
                { "<leader><space>x", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
                -- group "find"
                { "<leader>f", group = "find" },
                { "<leader>fD", "<cmd>Telescope lsp_definitions<cr>", desc = "Find definitions" },
                { "<leader>fG", "<cmd>Telescope live_grep<cr>", desc = "Find with live grep" },
                { "<leader>fR", "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
                { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
                { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
                { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
                { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
                { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
                { "<leader>fn", "<cmd>Telescope noice<cr>", desc = "Find noice message history" },
                { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects" },
                { "<leader>fs", "<cmd>Telescope aerial<cr>", desc = "Find symbol in this buffer" },
                -- group "git"
                { "<leader>g", group = "git" },
                { "<leader>g<space>", group = "toggle" },
                {
                    "<leader>g<space>b",
                    "<cmd>Gitsigns toggle_current_line<cr>",
                    desc = "Toggle current line blame",
                },
                {
                    "<leader>g<space>d",
                    "<cmd>Gitsigns toggle_deleted<cr>",
                    desc = "Toggle deleted",
                },
                { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line" },
                { "<leader>gd", group = "diff" },
                { "<leader>gdi", "<cmd>Gitsigns diffthis<cr>", desc = "View diff from index" },
                { "<leader>gdh", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "View diff from HEAD" },
                { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
                { "<leader>gh", group = "hunk" },
                { "<leader>ghR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset hunks in buffer" },
                { "<leader>ghS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage hunks in buffer" },
                { "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
                { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
                { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
                { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo last stage" },
                { "<leader>gv", group = "diffView" },
                {
                    "<leader>gv<space>",
                    "<cmd>DiffviewToggleFiles<cr>",
                    desc = "Toggle DiffView file tree",
                },
                { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
                { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
                { "<leader>gvr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh DiffView" },
                -- group "lsp"
                { "<leader>l", group = "lsp" },
                { "<leader>lD", "<cmd>Telescope lsp_definitions<cr>", desc = "Find definitions" },
                { "<leader>lR", "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
                {
                    "<leader>lS",
                    "<cmd>Telescope lsp_workspace_symbols<cr>",
                    desc = "Find symbols in workspace",
                },
                { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
                {
                    "<leader>ld",
                    vim.diagnostic.open_float,
                    desc = "Show diagnostics in floating window",
                },
                { "<leader>ll", vim.lsp.codelens.run, desc = "Run CodeLens action" },
                { "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol" },
                {
                    "<leader>lq",
                    vim.diagnostic.setqflist,
                    desc = "Add all diagnostics to quickfix list",
                },
                {
                    "<leader>ls",
                    "<cmd>Telescope lsp_document_symbols<cr>",
                    desc = "Find symbols in current buffer",
                },
                -- group "treesitter"
                { "<leader>s", group = "treesitter" },
                { "<leader>sc", group = "context" },
                {
                    "<leader>sc<space>",
                    "<cmd>TSContextToggle<cr>",
                    desc = "Toggle treesitter context",
                },
                { "<leader>scd", "<cmd>TSContextDisable<cr>", desc = "Disable treesitter context" },
                { "<leader>sce", "<cmd>TSContextEnable<cr>", desc = "Enable treesitter context" },
                { "<leader>su", "<cmd>TSUpdate<cr>", desc = "Update treesitter parsers" },
                -- group "test"
                { "<leader>t", group = "test" },
                { "<leader>tc", neotest.output_panel.clear, desc = "Clear test output panel" },
                { "<leader>to", neotest.output_panel.toggle, desc = "Toggle test output panel" },
                { "<leader>tr", group = "run" },
                {
                    "<leader>trs",
                    function()
                        neotest.run.run(vim.fn.getcwd())
                    end,
                    desc = "Run suite test",
                },
                {
                    "<leader>trf",
                    function()
                        neotest.run.run(vim.fn.expand("%"))
                    end,
                    desc = "Run file test",
                },
                { "<leader>trl", neotest.run.run_last, desc = "Run last test" },
                { "<leader>trn", neotest.run.run, desc = "Run nearest test" },
                { "<leader>ts", neotest.summary.toggle, desc = "Toggle test summary window" },
                { "<leader>tS", neotest.stop, desc = "Stop test" },
                -- group "trouble"
                { "<leader>x", group = "trouble" },
                { "<leader>x<space>", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
                {
                    "<leader>xd",
                    "<cmd>Trouble document_diagnostics<cr>",
                    desc = "Trouble document_diagnostics",
                },
                { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Trouble loclist" },
                { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Trouble quickfix" },
                {
                    "<leader>xr",
                    "<cmd>Trouble lsp_references<cr>",
                    desc = "Trouble lsp_references",
                },
                {
                    "<leader>xw",
                    "<cmd>Trouble workspace_diagnostics<cr>",
                    desc = "Trouble workspace_diagnostics",
                },
            })
            -- normal mode keymaps without <leader>
            wk.add({
                { "K", vim.lsp.buf.hover, desc = "Display hover info" },
                { "T", neotest.output.open, desc = "Display output of test" },
                { "Y", "y$", desc = "Yank to end of the line" },
                -- group "goto/comment"
                { "g", group = "goto/comment" },
                { "gD", vim.lsp.buf.declaration, desc = "Go to decleration" },
                { "gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
                { "gh", vim.lsp.buf.signature_help, desc = "Go to signature help" },
                -- group "prev"
                { "[", group = "prev" },
                { "[c", "<cmd>Gitsign prev_hunk<cr>", desc = "Prev git hunk" },
                {
                    "[d",
                    function()
                        vim.diagnostic.goto_prev({ float = false })
                    end,
                    desc = "Prev diagnostic",
                },
                { "[l", "<cmd>LLPrev<cr>", desc = "Prev loclist" },
                { "[q", "<cmd>QFPrev<cr>", desc = "Prev quickfix" },
                { "[t", neotest.jump.prev, desc = "Prev test" },
                -- group "next"
                { "]", group = "next" },
                { "]c", "<cmd>Gitsign next_hunk<cr>", desc = "Next git hunk" },
                {
                    "]d",
                    function()
                        vim.diagnostic.goto_next({ float = false })
                    end,
                    desc = "Next diagnostic",
                },
                { "]l", "<cmd>LLNext<cr>", desc = "Next loclist" },
                { "]q", "<cmd>QFNext<cr>", desc = "Next quickfix" },
                { "]t", neotest.jump.next, desc = "Next test" },
                -- with modifier key
                {
                    "<M-f>",
                    function()
                        conform.format({
                            lsp_fallback = true,
                        })
                    end,
                    desc = "Format file",
                },
                { "<M-[>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
                { "<M-]>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
                { "<C-l>", "<cmd>nohl<cr>", desc = "Clear highlight" },
            })
            -- visual mode mappings with <leader>
            wk.add({
                {
                    mode = { "v" },
                    { "<leader>g", group = "git" },
                    { "<leader>gh", group = "hunk" },
                    { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
                    { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
                },
            })
        end,
    },
}
