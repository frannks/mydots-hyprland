-- =======================================================
--                       LUALINE
-- =======================================================
require('lualine').setup {
  options = {
    theme = 'pywal-nvim',
    icons_enable = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
}
