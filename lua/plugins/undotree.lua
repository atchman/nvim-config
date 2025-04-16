-- undotree
--
return {
    {
      "mbbill/undotree",
      enabled = false,
      keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
      }

    }
}
