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
})
