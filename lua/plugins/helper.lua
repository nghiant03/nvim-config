return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
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
        { '<leader>a', '<cmd>AerialToggle<CR>', desc = "Toggle Aerial", mode = "n"}
      })
    end
  },
  {
    'stevearc/aerial.nvim',
    opts = {
      backends = {"lsp", "treesitter"},
      layout = {
        default_direction = "prefer_right"
      },
      close_automatic_event = {"unfocus"},
      nerd_font = true,
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end
    },
  },
  'windwp/nvim-autopairs',
  'kevinhwang91/nvim-bqf',
  'numToStr/Comment.nvim',
  'kevinhwang91/nvim-hlslens',
  'vladdoster/remember.nvim',
  'L3MON4D3/LuaSnip',
  'folke/todo-comments.nvim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'abecodes/tabout.nvim',
}
