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
        { "[c", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@code_cell.inner") end, desc = "Previous Code Cell" },
        { "]", group = "next" },
        { "]t", todo.jump_prev, desc = "Next todo comment" },
        { "]c", function() require("nvim-treesitter.textobjects.move").goto_next_start("@code_cell.inner") end, desc = "Next Code Cell" },
        { '<leader>ae', '<cmd>AerialToggle<CR>', desc = "Toggle Aerial"},
        { '<leader>m', group = "molten"},
        { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator"},
        { "<leader>moo", ":noautocmd MoltenEnterOutput<CR>", desc = "Open Output Window"},
        { "<leader>mrv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Execute Visual Selection", mode = "v"},
        { "<leader>mrr", ":MoltenReevaluateCell<CR>", desc = "Re-eval Cell"},
        { "<leader>moc", ":MoltenHideOutput<CR>", desc = "Close Output Window"},
        { "<leader>md", ":MoltenDelete<CR>", desc = "Delete Molten Cell"},
        { "<leader>mx", ":MoltenOpenInBrowser<CR>", desc = "Open Output In Browser"},
        { "<leader>r", group = "quarto"},
        { "<leader>rc", runner.run_cell, desc = "Run Cell" },
        { "<leader>ra", runner.run_above, desc = "Run Cell And Above" },
        { "<leader>rA", runner.run_all, desc = "Run All Cells" },
        { "<leader>rl", runner.run_line, desc = "Run Line" },
        { "<leader>r",  runner.run_range, desc = "Run Visual Range" },
        { "<leader>RA", function() runner.run_all(true) end, desc = "Run All Cells Of All Langs" },
        { "<leader>scl", function() require("nvim-treesitter.textobjects.swap").swap_next("@code_cell.outer") end, desc = "Swap Cell Next" },
        { "<leader>sch", function() require("nvim-treesitter.textobjects.swap").swap_previous("@code_cell.outer") end, desc = "Swap Cell Previous" },
        { "<leader>ac", function() require("nvim-treesitter.textobjects.select").select_textobject("@code_cell.outer") end, desc = "Select Around Cell" },
        { "<leader>ic", function() require("nvim-treesitter.textobjects.select").select_textobject("@code_cell.inner") end, desc = "Select In Cell" },
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
