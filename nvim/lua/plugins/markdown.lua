return {
  -- Browser-based live preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown Preview (browser)" },
    },
  },

  -- Glow: terminal preview via keymap
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
    opts = {},
    keys = {
      { "<leader>mg", "<cmd>Glow<cr>", ft = "markdown", desc = "Markdown Preview (glow)" },
    },
  },
}
