-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local function apply_transparent()
  -- Clear bg on all NeoTree highlights
  for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
    if name:match("^NeoTree") then
      local hl = vim.api.nvim_get_hl(0, { name = name })
      hl.bg = nil
      hl.ctermbg = nil
      vim.api.nvim_set_hl(0, name, hl)
    end
  end

  local groups = {
    "Normal", "NormalNC", "NormalFloat",
    "SignColumn", "FoldColumn", "EndOfBuffer",
    "StatusLine", "StatusLineNC",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "NONE" })
  end

  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1A1A1A", bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1A1A1A", bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#E7E9EA" })
  vim.api.nvim_set_hl(0, "lCursor", { fg = "#000000", bg = "#E7E9EA" })
  vim.api.nvim_set_hl(0, "CursorIM", { fg = "#000000", bg = "#E7E9EA" })
  vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_transparent })
