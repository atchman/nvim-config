return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
          snippets = {
            preset = "luasnip",
          },
        },
      },
      {
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
      },
      { "williamboman/mason-lspconfig.nvim", config = function() end },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- capabilities
      local capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        }
      }
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
      -- installed lua lsp with system package manager
      -- require("lspconfig").lua_ls.setup { capabilities = capabilities }

      -- auto formating on key
      -- vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
      -- auto formating on save if lsp of language is available / installed
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      local servers = {
        bashls = true,
        gopls = true,
        rust_analyzer = true,
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    end,
  },
}
