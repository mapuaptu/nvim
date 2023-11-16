local cwd = vim.fn.getcwd()

vim.bo.makeprg = "cc -o " .. cwd .. "/main % && " .. cwd .. "/main"
