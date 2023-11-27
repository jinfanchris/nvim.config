return {
  {
    "ChrisVicky/img-paste.vim",
    ft = { "markdown", "tex" },
    config = function()
      vim.g.mdip_upload = "~/.local/bin/upload-img-github"
    end,
  },
}
