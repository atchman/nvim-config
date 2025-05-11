-- filetypes
--

vim.filetype.add({
  extension = {
    container = "systemd",
    build = "systemd",
    image = "systemd",
    network = "systemd",
    pod = "systemd",
    rasi = "rasi",
    rofi = "rasi",
    secret = "secret",
    volume = "systemd",
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
