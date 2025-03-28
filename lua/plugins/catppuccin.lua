-- colorscheme catppuccin
--
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        harpoon = true,
        mason = true,
        mini = {
          enabled = true,
          indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        treesitter = true,
        snacks = {
          enabled = false,
          indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        lsp_trouble = true,
        which_key = true,
      },
    },
  }
}
