local cwd = vim.fn.getcwd()

vim.bo.makeprg = "gcc -o " .. cwd .. "/main % && " .. cwd .. "/main"
