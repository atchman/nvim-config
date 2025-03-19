-- bufferline-editor
--
return {
  "exit91/bufferline-editor.nvim",
  dependencies = {
    "akinsho/bufferline.nvim",
  },
  ---@type bufferline-editor.config
  opts = {
    max_width = 50,
    max_height = 50,
  },
  keys = {
    {
      "<leader><tab>",
      function()
        require("bufferline-editor").editor_toggle()
      end,
      desc = "Bufferline Editor Toogle",
    },
  },
}
