-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  -- 你可能已经有一些其他配置项在这里
  root_dir = function(fname)
    local util = require("lspconfig.util")
    return util.find_git_ancestor(fname) or util.path.dirname(fname)
  end,
  -- 其他`clangd`配置项
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

---- p4 analyzer
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.p4",
  callback = function()
    vim.bo.filetype = "p4"
  end,
})

-- local configs = require("lspconfig.configs")
-- if not configs.p4analyzer then
--   configs.p4analyzer = {
--     default_config = {
--       cmd = {
--         "p4analyzer",
--         "--stdio",
--         "--logpath",
--         "/home/christopher/p4-logs/",
--       },
--       root_dir = lspconfig.util.root_pattern(".git"),
--       filetypes = { "p4" },
--     },
--   }
-- end
-- lspconfig.p4analyzer.setup({})
