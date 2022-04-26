-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
local source_map = {
  nvim_lsp = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
  luasnip = "[Snippet]",
  cmdline = "[Command]",
  cmp_tabnine = "[Tabnine]",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_extend(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({ with_text = true, menu = source_map, maxwidth = 50 }),
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavvior = cmp.ConfirmBehavior.Replace })
      else
        cmp.complete()
      end
    end, { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      { "i", "c" }
    ),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "cmp_tabnine" },
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
  sources = {
    { name = "native_menu" },
  },
})
