vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.purs" },
  command = "set filetype=purescript",
})
