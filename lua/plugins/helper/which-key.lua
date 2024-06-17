local wk = require("which-key")
local builtin = require('telescope.builtin')
local todo = require('todo-comments')
wk.register({
  ["<leader>"] = {
    f = {
      name = "+find",
      f = {builtin.find_files, "Find File"},
      g = {builtin.live_grep, "Find String"},
      b = {builtin.buffers, "Find Buffer"},
      h = {builtin.help_tags, "Find Help Tag"}
    }
  },
  ["]"] = {
    name = "+next",
    t = {todo.jump_next, "Next todo comment"},
  },
  ["["] = {
    name = "+previous",
    t = {todo.jump_prev, "Previous todo comment"}
  },
  ["<C-\\>"] = {"<cmd>exe v:count1 . \"ToggleTerm\"<cr>", "Toggle Terminal"},
  ["<C-n>"] = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle File Explorer"},
  ["[c"] = {function() require("treesitter-context").go_to_context() end, "Go To Context"}
})
wk.register({
  ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", "Toggle Terminal"}
  },
  {
  mode = "t"
  }
)
