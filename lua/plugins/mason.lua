-- Mason
-- Package Manager for
-- LSP servers, DAP servers, linters, and formatters

return {
    "mason-org/mason.nvim",
    enabled = true,
    version = "2.*",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        'stylua', -- Used to format Lua code
        "shfmt",
      }
    },
}
