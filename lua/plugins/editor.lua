return {
  {
    "ChrisVicky/img-paste.vim",
    ft = { "markdown", "tex", "md" },
    config = function()
      vim.g.mdip_upload = "~/.local/bin/upload-img-github"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup(nil, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background", -- Set the display mode.
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_page_title = "${name}-New"
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0 -- auto close current preview window change from markdown buffer to another buffer.
      vim.g.mkdp_open_to_the_world = 1 -- preview server available to others in the network
      -- use custom ip to open preview page
      -- FOR detailed : "https://github.com/iamcco/markdown-preview.nvim/pull/9"
      vim.g.mkdp_port = "9090"
      vim.g.mkdp_echo_preview_url = 1 -- Echo preview page url in command line
      -- vim.g.mkdp_browser = "/usr/bin/min" -- Set Browser to surf
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/lua/config/markdown.css")
    end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },
  {
    "jbyuki/venn.nvim",
    enabled = true,
    ft = { "markdown", "text" },
  },
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    -- Image Plugin for markdown
    "3rd/image.nvim",
    config = function()
      -- ...
    end,
  },
  {
    "samodostal/image.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      pipe_table = { style = "normal" },
      code = {
        position = "right",
        width = "block",
        right_pad = 10,
      },
      only_render_image_at_cursor = true,
      checkbox = {
        custom = {
          important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
          wrong = { raw = "[*]", rendered = "✘ ", highlight = "RenderMarkdownError" },
          right = { raw = "[v]", rendered = "✔ ", highlight = "RenderMarkdownSuccess" },
        },
      },
    },
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   ---@module "ibl"
  --   ---@type ibl.config
  --   opts = {},
  -- },
}
