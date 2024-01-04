local cwd = vim.fn.getcwd()

vim.bo.makeprg = "zig build && " .. cwd .. "/zig-out/bin/zig"
