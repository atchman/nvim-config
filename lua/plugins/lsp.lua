return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      "saghen/blink.cmp",
      "folke/lazydev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- -- auto formating on key
      --     -- vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
      --     -- auto formating on save if lsp is available / installed
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

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- lsp keymap
          -- Rename the variable under your cursor.
          vim.keymap.set("n", "lbr", vim.lsp.buf.rename, { desc = "[L]SP [B]uffer [R]ename" })

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          vim.keymap.set({ "n", "x" }, "lba", vim.lsp.buf.code_action, { desc = "[L]SP [B]uffer [A]ction" })

          -- Find references for the word under your cursor.
          vim.keymap.set("n", "lrr", require('telescope.builtin').lsp_references, { desc = "[L]SP [W]ord [R]eferences" })

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          vim.keymap.set("n", "lri", require('telescope.builtin').lsp_implementations,
            { desc = "[L]SP [R]ef [I]mplementation" })

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          vim.keymap.set("n", "lrd", require('telescope.builtin').lsp_definitions, { desc = "[L]SP [R]ef [D]efinition" })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          vim.keymap.set("n", "lrD", vim.lsp.buf.declaration, { desc = "[L]SP [R]ef [D]eclaration" })

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          vim.keymap.set("n", "gO", require('telescope.builtin').lsp_document_symbols, { desc = "Open Document Symbols" })

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          vim.keymap.set("n", "gW", require('telescope.builtin').lsp_dynamic_workspace_symbols,
            { desc = "Open Workspace Symbols" })

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          vim.keymap.set("n", "grt", require('telescope.builtin').lsp_type_definitions,
            { desc = "[L]SP [T]ype Definition" })

          -- When you move your cursor, the highlights will be cleared (the second autocommand)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
        end
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
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

      -- servers
      local servers = {
        -- ansible
        ansiblels = {},
        -- bash
        bashls = {},
        -- golang
        gopls = {},
        -- lua
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        -- rust
        rust_analyzer = {},
        -- systemd
        -- systemd_language_server = {},
        -- typst
        tinymist = {},
      }

      -- ensure the servers and tools above are installed
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local config = servers[server_name] or {}
            vim.lsp.config(server_name, config)
            vim.lsp.enable(server_name)
          end
        }
      }
    end,
  },
}
