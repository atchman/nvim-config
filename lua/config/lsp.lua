-- LSP Config
--

vim.lsp.enable({
  "lua_ls",
  -- 'gopls',
  -- 'rust-analyzer',
  -- "systemd",
})


{
  require('nvim-lspconfig').config({
    --   vim.lsp.config("*", {
    --     capabilities = vim.lsp.protocol.make_client_capabilities()
    --   }),

    -- auto formating on key
    -- vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
    -- auto formating on save if lsp is available / installed
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
    --
    --     vim.api.nvim_create_autocmd('LspAttach', {
    --       group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    --       callback = function(event)
    --         -- lsp keymap
    --         -- Rename the variable under your cursor.
    --         vim.keymap.set("n", "lbr", vim.lsp.buf.rename, { desc = "[L]SP [B]uffer [R]ename" })
    --
    --         -- Execute a code action, usually your cursor needs to be on top of an error
    --         -- or a suggestion from your LSP for this to activate.
    --         vim.keymap.set({ "n", "x" }, "lba", vim.lsp.buf.code_action, { desc = "[L]SP [B]uffer [A]ction" })
    --
    --         -- Find references for the word under your cursor.
    --         vim.keymap.set("n", "lrr", require('telescope.builtin').lsp_references, { desc = "[L]SP [W]ord [R]eferences" })
    --
    --         -- Jump to the implementation of the word under your cursor.
    --         --  Useful when your language has ways of declaring types without an actual implementation.
    --         vim.keymap.set("n", "lri", require('telescope.builtin').lsp_implementations,
    --           { desc = "[L]SP [R]ef [I]mplementation" })
    --
    --         -- Jump to the definition of the word under your cursor.
    --         --  This is where a variable was first declared, or where a function is defined, etc.
    --         --  To jump back, press <C-t>.
    --         vim.keymap.set("n", "lrd", require('telescope.builtin').lsp_definitions, { desc = "[L]SP [R]ef [D]efinition" })
    --
    --         -- WARN: This is not Goto Definition, this is Goto Declaration.
    --         --  For example, in C this would take you to the header.
    --         vim.keymap.set("n", "lrD", vim.lsp.buf.declaration, { desc = "[L]SP [R]ef [D]eclaration" })
    --
    --         -- Fuzzy find all the symbols in your current document.
    --         --  Symbols are things like variables, functions, types, etc.
    --         vim.keymap.set("n", "gO", require('telescope.builtin').lsp_document_symbols, { desc = "Open Document Symbols" })
    --
    --         -- Fuzzy find all the symbols in your current workspace.
    --         --  Similar to document symbols, except searches over your entire project.
    --         vim.keymap.set("n", "gW", require('telescope.builtin').lsp_dynamic_workspace_symbols,
    --           { desc = "Open Workspace Symbols" })
    --
    --         -- Jump to the type of the word under your cursor.
    --         --  Useful when you're not sure what type a variable is and you want to see
    --         --  the definition of its *type*, not where it was *defined*.
    --         vim.keymap.set("n", "grt", require('telescope.builtin').lsp_type_definitions,
    --           { desc = "[L]SP [T]ype Definition" })
    --
    --         -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover" })
    --         -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "[d]efinition" })
    --         -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "[D]eclaration" })
    --         -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "[I]implementation" })
    --         -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "[T]ype Definition" })
    --         -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "[R]eference" })
    --         -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "[S]ignature Help" })
    --         -- vim.keymap.set("n", "gc", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Ren[M]e" })
    --         -- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "" })
    --         -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "" })
    --
    --         -- When you move your cursor, the highlights will be cleared (the second autocommand)
    --         local client = vim.lsp.get_client_by_id(event.data.client_id)
    --         if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
    --           local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
    --           vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --             buffer = event.buf,
    --             group = highlight_augroup,
    --             callback = vim.lsp.buf.document_highlight,
    --           })
    --
    --           vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    --             buffer = event.buf,
    --             group = highlight_augroup,
    --             callback = vim.lsp.buf.clear_references,
    --           })
    --           vim.api.nvim_create_autocmd('LspDetach', {
    --             group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
    --             callback = function(event2)
    --               vim.lsp.buf.clear_references()
    --               vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
    --             end,
    --           })
    --         end
    -- end
  }),
},
