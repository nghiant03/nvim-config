-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true



require("nvim-tree").setup {
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = true,
  modified = {
    enable = true,
  },
  renderer = {
    highlight_opened_files = "name",
  },
  live_filter = {
    always_show_folders = false
  },
  update_focused_file = {
    enable = true,
  },
  actions = {
    change_dir = {
      global = true
    }
  }
}
