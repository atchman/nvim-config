-- mason
-- package manager for
-- LSP servers, DAP servers, linters, and formatters

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
    },
  },
}
