-- snippets plugin
--
return {
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    lazy = true,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      spec = {
        { "<leader>S",  group = "[S]nippets" },
      },
    },
  }
}
