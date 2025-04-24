-- filetypes
--

vim.filetype.add({
  extension = {
    container = "dosini",
    build = "dosini",
    image = "dosini",
    network = "dosini",
    pod = "dosini",
    rasi = "rasi",
    rofi = "rasi",
    volume = "dosini",
    wofi = "rasi"
  },
  filename = {
    ["vifmrc"] = "vim",
  },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/mako/config"] = "dosini",
    [".*/kitty/.+%.conf"] = "kitty",
    [".*/hypr/.+%.conf"] = "hyprlang",
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

-- vim.treesitter.language.register("bash", "kitty")
