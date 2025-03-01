-- oil.nvim

return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    keymap = {
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    },
  }
}
