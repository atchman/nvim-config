-- completion plugin
--

return {
  {
    'saghen/blink.cmp',
    event = "VimEnter",
    version = "1.*",
    -- optional: provides snippets for the snippet source
    dependencies = {
      'L3MON4D3/LuaSnip',
      "folke/lazydev.nvim"
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      snippets = { preset = 'luasnip' },

      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      fuzzy = { implementation = 'lua' },

      signature = { enabled = true },
    },
  },
}
