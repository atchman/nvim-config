-- typst language server
--

---@type vim.lsp.Config
return {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_markers = { '.git', },
  -- settings = {
  --   }
}
