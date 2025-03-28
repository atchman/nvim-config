# Neovim Config

My Neovim config and some instructions for myself.  

## Requirement

* Neovim >= 0.8.0  
* git >= 2.19.0 
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
    --local builtin = require('nvim-tree.builtin')
      vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle)   -- Open or close the tree. Takes an optional path argument
      vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFocus)    -- Open the tree if it is closed, and then focus on the tree.
      vim.keymap.set('n', '<leader>tff', vim.cmd.NvimTreeFindFile) -- Move the cursor in the tree for the current buffer, opening folders if needed
      vim.keymap.set('n', '<leader>tc', vim.cmd.NvimTreeCollapse) -- Collapses the nvim-tree recursively
        
      require("nvim-tree").setup({
              sort_by = "case_sensitive",

              -- config
              renderer = {
              group_empty = true,
              },
              filters = {
              dotfiles = true,
              },
      })
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
=======
# my neovim config

# Requirements
- neovim => 0.10.3
- git => 2.47.1
- gcc =>
- ripgrep => 14.1.1
- fd => 10.2.0
- fzf
- wl-copy

# Build && Install

```shell
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```


# Thank you

tjdevries - [advent of neovim](https://www.youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM)
