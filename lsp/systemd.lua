---@brief
---
--- https://github.com/psacawa/systemd-language-server
---
--- `systemd-language-server` can be installed via `pip`:
--- ```sh
--- pip install systemd-language-server
--- ```
---
--- Language Server for Systemd Unit Files Types
---@type vim.lsp.Config
return {
  cmd = { 'systemd-language-server' },
  filetypes = { 'systemd' },
  root_markers = { '.git' },
}
