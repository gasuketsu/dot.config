return {
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = {
                preset = "enter",
                ["<C-space>"] = {},
                ["<C-n>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return cmp.show()
                        end
                    end,
                    "select_next",
                    "fallback_to_mappings",
                },
                ["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
                ["<Esc>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.hide()
                        end
                    end,
                    "fallback",
                },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
                ["<Tab>"] = { "snippet_forward", "fallback" },
            },
            cmdline = {
                keymap = {
                    ["<Tab>"] = {
                        function(cmp)
                            if cmp.is_menu_visible() then
                                return cmp.select_next()
                            end
                        end,
                        "show",
                        "accept",
                    },
                    ["<CR>"] = { "select_and_accept", "fallback" },
                },
                completion = {
                    ghost_text = {
                        enabled = false,
                    },
                    list = {
                        selection = { preselect = false },
                    },
                },
            },
            completion = {
                list = {
                    selection = { preselect = false },
                },
            },
            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
