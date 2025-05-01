# my neovim config

## Requirements
- neovim >= 0.11.0
- git >= 2.47.1
- gcc =>
- ripgrep >= 14.1.1
- fd >= 10.2.0
- fzf
- wl-copy

- nerd font (optional)
- tree-sitter


## Build && Install

```shell
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## Debug

```
:messages  
:checkhealth
``` 

## Thank you

- tjdevries - [advent of neovim](https://www.youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
