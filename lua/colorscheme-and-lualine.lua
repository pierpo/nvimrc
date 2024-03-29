COLORSCHEME = "tokyonight"

vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { border = "blue" }

vim.cmd([[colorscheme ]] .. COLORSCHEME)

require("lualine").setup {
  options = {
    theme = COLORSCHEME,
    section_separators = { "", "" },
    component_separators = { "", "" },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { { "mode", upper = true } },
    lualine_b = { { "branch", icon = "" } },
    lualine_c = { { "filename", file_status = true }, { "diagnostics", sources = { "nvim_diagnostic" } } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress", "diff" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "fzf" },
}
