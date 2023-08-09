require("tokyonight").setup({
style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
transparent = true, -- Enable this to disable setting the background color
terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
styles = {
comments = "italic",
keywords = "italic",
functions = "NONE",
variables = "NONE",
Background = "transparent",
sidebars = "transparent", -- style for sidebars, see below
floats = "transparent", -- style for floating windows
},
sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
dim_inactive = false, -- dims inactive windows
lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
on_colors = function(colors) end,
on_highlights = function(highlights, colors) end,
})
local colors = require("tokyonight.colors").setup({})
vim.cmd("highlight WinSeparator guifg=" .. colors.blue)
vim.cmd("highlight WinSeparator guifg=" .. colors.bg_highlight)
vim.cmd([[colorscheme tokyonight]])
--#region
--#region
-- Example config in Lua
-- vim.g.monokaipro_filter = "spectrum"
-- vim.g.monokaipro_italic_functions = true
-- vim.g.monokaipro_sidebars = { "vista_kind", "packer" }
-- vim.g.monokaipro_flat_term = true
-- vim.g.monokaipro_transparent = true

-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.monokaipro_colors = { hint = "orange", error = "#ff0000" }

-- -- Load the colorscheme
-- vim.cmd([[colorscheme monokaipro]])
