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
  {
    "akinsho/bufferline.nvim",
    config = function(_, opts)
      require("bufferline").setup(opts)
      local function fix_bufferline()
        local hls = vim.fn.getcompletion("BufferLine", "highlight")
        for _, hl in ipairs(hls) do
          local current = vim.api.nvim_get_hl(0, { name = hl })
          current.bg = nil
          current.ctermbg = nil
          -- Fix selected tab text: ensure fg is light
          if hl:find("Selected") and (not current.fg or current.fg < 0x404040) then
            current.fg = 0xE7E9EA
          end
          vim.api.nvim_set_hl(0, hl, current)
        end
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
      end
      vim.api.nvim_create_autocmd("ColorScheme", { callback = fix_bufferline })
      vim.defer_fn(fix_bufferline, 100)
    end,
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
          },
        },
      },
    },
  },
  {
    "keaising/im-select.nvim",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "im-select",
    },
  },
  {
    "tris203/precognition.nvim",
    opts = {},
    keys = {
      { "<leader>up", function() require("precognition").toggle() end, desc = "Toggle Precognition" },
    },
  },
}
