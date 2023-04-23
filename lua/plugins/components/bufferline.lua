vim.opt.mousemoveevent = true
require("bufferline").setup{
  options = {
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    hover = {
        enabled = true,
        delay = 0,
        reveal = {'close'}
    },
    diagnostics = "nvim-lsp",
    separator_style = "thin",
    numbers = "id",
    groups = {
      items = {
        require("bufferline.groups").builtin.pinned:with({ icon =  "" })
      }
    },
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
        }
    },
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
--FIX: tabline offset disappear when current display buffer is closed
--TODO: fix warning in tabline
