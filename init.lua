print("Hello World")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
require("config.options")
require("config.keymaps")
require("config.autocommands")

require("config.filetype")

-- lazy.nvim
require("config.lazy")
require("config.colorscheme")

-- lsp
-- require("config.lsp.")
-- vim.lsp.enable({
--   "lua_ls",
-- 'gopls',
-- 'rust-analyzer',
-- "systemd",
-- })
-- diagnostic
require("config.diagnostics")
