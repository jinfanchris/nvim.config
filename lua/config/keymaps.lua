-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local k = vim.keymap
local opts = { noremap = true, silent = true }

-- Quick esc habits
k.set("i", "jk", "<ESC>", opts)

-- Buffer Switcher
k.set("n", "<tab>", ":bn<cr>", opts) -- Next
k.set("n", "<s-tab>", ":bN<cr>", opts) -- Preview
k.set("n", "<leader>x", ":bd<cr>", opts) -- delete

-- Jump window
k.set("n", "<leader>h", "<c-w>h")
k.set("n", "<leader>j", "<c-w>j")
k.set("n", "<leader>k", "<c-w>k")
k.set("n", "<leader>l", "<c-w>l")
k.set("n", "<leader><left>", "<c-w>h")
k.set("n", "<leader><up>", "<c-w>j")
k.set("n", "<leader><right>", "<c-w>l")
k.set("n", "<leader><down>", "<c-w>k")
