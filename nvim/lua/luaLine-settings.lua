--lualine settings
require("lualine").setup({
  options = {
    icons_enabled = true,
    components_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    theme = "auto",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {},
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { { "filename", file_status = true, path = 3 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "aerial" },
    lualine_y = {},
    lualine_z = { "tabs" },
  },
  extensions = { "fugitive", "nvim-tree", "aerial" },
})
