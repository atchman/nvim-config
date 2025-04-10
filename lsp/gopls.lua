-- go language server
--

---@type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = {
    'go',
    'gomod',
    'gowork',
    'gotmpl'
  },
  root_markers = {
    'go.mod',
    'go.work',
    '.git'
  },
  settings = {
    analyses = {
      unusedparams = true,
      shadow = true,
    },
  }
}
