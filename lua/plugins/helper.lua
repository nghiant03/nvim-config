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
      local runner = require('quarto.runner')
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
        { "[ct", function() require("treesitter-context").go_to_context() end, desc = "Go To Context" },
        { "[t", todo.jump_next, desc = "Previous todo comment" },
        { "]", group = "next" },
        { "]t", todo.jump_prev, desc = "Next todo comment" },
        { '<leader>ae', '<cmd>AerialToggle<CR>', desc = "Toggle Aerial"},
        { '<leader>m', group = "molten"},
        { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator"},
        { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Open Output Window"},
        { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Execute Visual Selection", mode = "v"},
        { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Re-eval Cell"},
        { "<leader>mc", ":MoltenHideOutput<CR>", desc = "Close Output Window"},
        { "<leader>md", ":MoltenDelete<CR>", desc = "Delete Molten Cell"},
        { "<leader>mx", ":MoltenOpenInBrowser<CR>", desc = "Open Output In Browser"},
        { "<leader>q", group = "quarto"},
        { "<leader>qc", runner.run_cell, desc = "Run Cell" },
        { "<leader>qa", runner.run_above, desc = "Run Cell And Above" },
        { "<leader>qb", runner.run_below, desc = "Run Cell And Below"},
        { "<leader>qA", runner.run_all, desc = "Run All Cells" },
        { "<leader>ql", runner.run_line, desc = "Run Line" },
        { "<leader>qv",  runner.run_range, desc = "Run Visual Range", mode = "v" },
        { "<leader>qRA", function() runner.run_all(true) end, desc = "Run All Cells Of All Langs" },
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
    },
  },
  {
    'windwp/nvim-autopairs',
    dependencies = 'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup{}
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  'kevinhwang91/nvim-bqf',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      -- configuration goes here
    },
  },
  'kevinhwang91/nvim-hlslens',
  'vladdoster/remember.nvim',
  'L3MON4D3/LuaSnip',
  'folke/todo-comments.nvim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
}
