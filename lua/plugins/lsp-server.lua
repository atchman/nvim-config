-- LSP Server Installation
--

-- LSP Servers
---@class LspServersConfig
---@field servers table<string, vim.lsp.Config>
local servers = {
  -- ansible-language-server
  "ansiblels",
  -- bash-language-server
  "bashls",
  -- golang
  "gopls",
  -- lua-language-server
  "lua_ls",
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
          -- rust-analyzer
          "rust_analyzer",
          -- systemd-language-server
          "systemd_ls",
          -- typst
          "tinymist",
        }

        -- linter, ...
        ---@field others table<string, vim.lsp.Config>
        local others = {
          -- ansible linter
          "ansible-lint",
          -- golang formatter
          "goimports",
          "golines",
          "gomodifytags",
          "gotests",
          -- golang linter
          "golangci-lint",
          -- shell formatter (sh/bash/mksh)
          "shfmt",
          -- lua formatter
          "stylua", -- Used to format Lua code
          -- systemd linter
          "systemdlint",
        }

        -- capabilities
        -- local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
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
                    "mason-org/mason.nvim",
                    "neovim/nvim-lspconfig",
                    "folke/lazydev.nvim",
                    "saghen/blink.cmp",
                  },
                  opts = {
                    -- automatic_installation = false,
                    ---@type string[]
                    ensure_installed = servers,

                    ---@type boolean | string[] | { exclude: string[] }
                    automatic_enable = true,
                  },
                },
                {
                  "WhoIsSethDaniel/mason-tool-installer.nvim",
                  enabled = true,
                  opts = {
                    ensure_installed = others,
                  }
                }
              }
