-- LSP Server Installation
--

-- LSP Servers
local servers = {
  -- ansible
  "ansible-language-server",
  "ansible-lint",
  -- bash
  "bash-language-server",
  -- golang
  "gopls",
  -- lua
  "lua-language-server",
  "stylua", -- Used to format Lua code
  -- lua_ls = {
  --   settings = {
  --     Lua = {
  --       completion = {
  --         callSnippet = "Replace",
  --       },
  --       -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
  --       -- diagnostics = { disable = { 'missing-fields' } },
  --     },
  --   },
  -- },
  -- rust
  "rust-analyzer",
  -- shell
  "shfmt",
  -- systemd
  "systemd-language-server",
  "systemdlint",
  -- typst
  "tinymist",
}

-- capabilities
local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
-- capabilities
-- local capabilities = {
--   textDocument = {
--     foldingRange = {
--       dynamicRegistration = false,
--       lineFoldingOnly = true
--     }
--   }
-- }

return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    version = "2.*",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = true,
    version = "2.*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
      "saghen/blink.cmp",
      "folke/lazydev.nvim",
    },
    opts = {
      -- ensure_installed = ensure_installed,
      -- automatic_installation = false,
      ensure_installed = ensure_installed,
      automatic_enable = true
    },
  },
}

