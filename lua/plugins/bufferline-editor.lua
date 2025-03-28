-- bufferline-editor
--
return {
  "cornservant/bufferline-editor.nvim",
  dependencies = {
    "akinsho/bufferline.nvim",
  },
  ---@type bufferline-editor.config
  opts = {
    max_width = 50,
    max_height = 20,
  },
  keys = {
    {
      "<C-e>",
      function()
        require("bufferline-editor").editor_toggle()
      end,
      desc = "Bufferline Editor Toogle",
    },
  },
}
