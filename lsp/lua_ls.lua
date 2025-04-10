-- lua language server
--

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  root_markers = { '.git' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    },
    telemetry = { enabled = false },
  }
}
