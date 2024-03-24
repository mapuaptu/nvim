local anchor =
  vim.fs.find({ "main.roc", ".gitignore" }, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })[1]

local root_dir = vim.fs.dirname(anchor)

vim.lsp.start({
  name = "roc-language-server",
  cmd = { "/home/mapuaptu/bin/roc_/roc_nightly-linux_x86_64/roc_language_server" },
  root_dir = root_dir,
})

vim.bo.makeprg = "roc %"
