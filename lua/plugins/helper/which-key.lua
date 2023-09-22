local wk = require("which-key")
local builtin = require('telescope.builtin')
wk.register({
  ["<leader>"] = {
    f = {
      name = "+file";
      f = {builtin.find_files, "Find File"},
      g = {builtin.live_grep, "Find String"},
      b = {builtin.buffers, "Find Buffer"},
      h = {builtin.help_tags, "Find Help Tag"}
    }
  },
  ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", "Toggle Terminal"},
  ["<C-n>"] = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle File Explorer"}
})
wk.register({
  ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", "Toggle Terminal"}
  },
  {
  mode = "t"
  }
)
