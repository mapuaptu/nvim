-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- map("n", "<leader>.", "<cmd>make<CR> g;", { desc = "make"})
map("n", "g.", "<cmd>make<CR>", { desc = "make" })
map("n", "<leader>bf", "<cmd>let @+=@%<CR>", { desc = "copy file path" })
map("n", "<leader>tr", "<cmd>TroubleRefresh<CR>", { desc = "refresh Trouble" })
