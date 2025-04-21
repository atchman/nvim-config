print("Hello World")

require("config.lazy")
require("config.colorscheme")

vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 20

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- diff
vim.opt.fillchars = {
  diff = '/',
}
vim.opt.diffopt = {
  'internal',
  'filler',
  'closeoff',
  'context:12',
  'algorithm:histogram',
  'linematch:200',
  'indent-heuristic',
}

-- vim.diagnostic.config = {
--   signs = {
--     text = {
--       error = icon,
--       warn = warn_icon,
--     }
--   }
-- }

-- keymap
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "source file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "source .lua file" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "source lua" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Qui[C]kfix [N]ext" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Qui[C]kfix [P]revious" })

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Es[c]ape" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Escape Terminal" })

-- select last inserted text
vim.keymap.set("n", "gV", "`[v`]", opts)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
