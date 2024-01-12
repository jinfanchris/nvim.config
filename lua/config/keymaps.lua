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

-- mdip, Markdown Image Clip
k.set("n", "<leader>pq", ":call mdip#MarkdownClipboardImage()<CR><ESC>")
k.set("n", "<leader>pp", ":call mdip#MarkdownClipboardImageTitleMode()<CR><ESC>k$2F>")
