local anchor = vim.fs.find({ "go.mod" }, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })[1]
local cwd = vim.fn.getcwd()
local root_dir = vim.fs.dirname(anchor) or cwd

vim.bo.makeprg = "cd " .. root_dir .. " && go build && ./main"
