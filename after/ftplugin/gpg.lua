-- GnuPG
--

vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    callback = function()
      vim.opt.backup = false
      vim.opt.swapfile = false
    end
  })

-- au BufRead,BufNewFile *.asc,*.gpg,*.pgp setlocal
