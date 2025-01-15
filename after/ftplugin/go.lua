-- go

local map = require("utils").map
local job_id = 0
map("n", "<space>tidy", function()
  vim.fn.chansend(job_id, { "go mod tidy\r\n" })
end)
