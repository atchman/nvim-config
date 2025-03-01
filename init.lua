print("Hello World")

require("config.lazy")

require("config.colorscheme")

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 20

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- keyman
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "source file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "source .lua file" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "source lua" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Qui[C]kfix [N]ext" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Qui[C]kfix [P]revious" })

vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Es[c]ape" })

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
