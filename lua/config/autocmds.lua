-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.wo.conceallevel = 0
    vim.wo.spell = false
  end,
})

-- ################################################
-- ##               LATEX   autocmd              ##
-- ################################################
-- Auto build latex when save the file
-- use make command `Makefile` to build `Latex Project`
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("texfilesave", { clear = true }),
--   pattern = "*.tex",
--   callback = function()
--     vim.fn.jobstart({ "make" }, {
--       stdout_buffered = false,
--     })
--   end,
-- })

-- ################################################
-- ##               V E N N  begin               ##
-- ################################################
-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
  end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true })

-- Remove Table Render in Markdown which is annoying
require("render-markdown").setup({
  pipe_table = { style = "normal" },
  code = {
    position = "right",
    width = "block",
    right_pad = 10,
  },
  checkbox = {
    custom = {
      important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
      wrong = { raw = "[*]", rendered = "✘ ", highlight = "RenderMarkdownError" },
      right = { raw = "[v]", rendered = "✔ ", highlight = "RenderMarkdownSuccess" },
    },
  },
})
