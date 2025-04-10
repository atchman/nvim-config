-- rust-analyzer
--

---@type vim.lsp.Config
return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rs' },
  root_markers = { '.git' },
  -- settings = {
  -- }
}
