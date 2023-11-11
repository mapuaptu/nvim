local anchor =
  vim.fs.find({ "main.roc", ".gitignore" }, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })[1]

local root_dir = vim.fs.dirname(anchor)

vim.lsp.start({
  name = "roc-language-server",
  cmd = { "/home/mapuaptu/projects/my/roc/roc-lang/target/release/roc_ls" },
  root_dir = root_dir,
})
