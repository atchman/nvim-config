-- lsp server bootstrapping
-- mason
--

local servers = {
  bashls = true,
  gopls = true,
  rust_analyzer = true,
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua', -- Used to format Lua code
  "shfmt",
})


return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", config = function() end },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  build = ":MasonUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
    },
  },
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }
}
