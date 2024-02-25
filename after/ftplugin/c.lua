local cwd = vim.fn.getcwd()

vim.bo.makeprg = "gcc-13 -o " .. cwd .. "/main % && " .. cwd .. "/main"
