return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      tweak_background = { normal = "none" },
      tweak_highlight = {
        -- Dim unused code + strikethrough
        DiagnosticUnnecessary = { fg = "#505050", strikethrough = true },
      },
      tweak_color = {
        -- Bump grays brighter for better contrast
        gray4 = "#707070",
        gray5 = "#8A8A8A",
        gray6 = "#9A9A9A",
        gray7 = "#B0B0B0",
        gray8 = "#D0D0D0",
        gray9 = "#E7E9EA",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lackluster-hack",
    },
  },
}
