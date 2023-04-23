require('lualine').setup{
  options = {
    icons_enabled = true,
    disabled_filetypes = {"NvimTree", "packer", "aerial"},
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {"encoding", "fileformat"},
    lualine_y = {"filetype"},
    lualine_z = {"progress", "location"},
  }
}
