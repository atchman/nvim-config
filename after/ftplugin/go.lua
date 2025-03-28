-- go
--
vim.o.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.softtabstop = 4

vim.keymap.set("n", "<space>td", function()
  require("dap-go").debug_test()
end, { buffer = 0 })

local map = require("utils").map
local job_id = 0
map("n", "<space>tidy", function()
  vim.fn.chansend(job_id, { "go mod tidy\r\n" })
end)
