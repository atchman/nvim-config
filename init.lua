print("Hello World")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
require("config.options")
require("config.keymaps")
require("config.autocommands")

-- lazy.nvim
require("config.lazy")
require("config.colorscheme")

-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
local job_id = 0
vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 5)
    job_id = vim.bo.channel
  end,
  { desc = "[S] [T]erminal" })

-- lsp
vim.lsp.enable({
  'lua_ls',
  'gopls',
  'rust-analyzer',
})
