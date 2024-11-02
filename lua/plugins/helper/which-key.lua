local wk = require("which-key")
local builtin = require('telescope.builtin')
local todo = require('todo-comments')
wk.add({
  { "<C-\\>", '<cmd>exe v:count1 . "ToggleTerm"<cr>', desc = "Toggle Terminal" },
  { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "t" },
  { "<C-n>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Explorer" },
  { "<leader>f", group = "find" },
  { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
  { "<leader>ff", builtin.find_files, desc = "Find File" },
  { "<leader>fg", builtin.live_grep, desc = "Find String" },
  { "<leader>fh", builtin.help_tags, desc = "Find Help Tag" },
  { "[", group = "previous" },
  { "[c", function() require("treesitter-context").go_to_context() end, desc = "Go To Context" },
  { "[t", todo.jump_next, desc = "Previous todo comment" },
  { "]", group = "next" },
  { "]t", todo.jump_prev, desc = "Next todo comment" },
})
