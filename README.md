# Neovim Config

My Neovim config and some instructions for myself.  

## Requirement

* Neovim >= 0.8.0  
* git  
* Nerd Font (optional)  
* xclip (optional)  
* tree-sitter (for treesitter)
* ripgrep  
* g++  

## Installation

Installation for my neovim config  

```
$ mkdir -p ~/git
$ git clone https://github.com/atchman/nvim-config.git ~/git
$ mkdir -p  ~/.config/nvim/
$ ln -s ~/git/nvim-config ~/.config/nvim

```

## Plugins
add Plugin to ```/lua/plugin/<Plugin name>.lua```  
  
For Example:

```
return {
  {
    "nvim-neo-tree/neo-tree.nvim", tag = "stable",
    cmd = "NeoTreeFocusToggle",
    dependencies = {
      "nvim-lua/plenary.nvim", lazy = true,
      "nvim-tree/nvim-web-devicons", lazy = true, -- not strictly required, but recommended
      "MunifTanjim/nui.nvim", lazy = true,
    },
  },
  
  config = function()
  -- Config here
  end,

  opts = function()
  -- opts here
  ende,

 }
```  

## Debug

```
:messages  
:checkhealth  
```  
