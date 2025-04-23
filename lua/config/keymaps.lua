-- keymaps
--

-- Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })
vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Es[c]ape" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Escape Terminal" })
-- vim.keymap.set("t", "<leader>q", "<cmd>quit<cr>", { desc = "[Q]uit" })

-- clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "[y]ank Clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "[Y]ank Clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "[p]aste Clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "[P]aste Clipboard" })

-- Source File
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "source file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "source .lua file" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "source lua" })

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Qui[C]kfix [N]ext" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Qui[C]kfix [P]revious" })

-- Buffer
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- select last inserted text
vim.keymap.set("n", "gV", "`[v`]", { desc = "Select last inserted text" })
