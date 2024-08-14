local anchor = vim.fs.find({ "Makefile" }, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })[1]

local root_dir = vim.fs.dirname(anchor)

vim.bo.makeprg = "cd " .. root_dir .. " && make"
