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
        -- Bump grays for better contrast
        gray4 = "#707070",
        gray5 = "#8A8A8A",
        gray6 = "#9A9A9A",
        gray7 = "#B0B0B0",
        gray8 = "#D0D0D0",
        gray9 = "#E7E9EA",
        -- Richer accent colors (muted, not bright)
        orange = "#E8976C",
        yellow = "#D4B56A",
        green = "#8FB880",
        blue = "#7BA1C8",
        red = "#C75D5D",
      },
      tweak_syntax = {
        string = "#8FB880",
        comment = "#6A6A6A",
        builtin = "#7BA1C8",
        type = "#D4B56A",
        keyword = "#C0A0D0",
        keyword_return = "#E8976C",
        keyword_exception = "#C75D5D",
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
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            exclude = { "node_modules", ".git", "dist", "build", ".next", ".yarn" },
          },
          grep = {
            exclude = { "node_modules", ".git", "dist", "build", ".next", ".yarn" },
          },
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
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "im-select",
      set_previous_events = {},
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
