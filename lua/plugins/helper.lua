return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require("which-key")
      local todo = require('todo-comments')
      local runner = require('quarto.runner')
      local snacks = require('snacks')
      local dap = require('dap')
      local dapui = require('dapui')
      wk.add({
        { "<C-\\>", '<cmd>exe v:count1 . "ToggleTerm"<cr>', desc = "Toggle Terminal" },
        { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "t" },
        { "[", group = "previous" },
        { "[ct", function() require("treesitter-context").go_to_context() end, desc = "Go To Context" },
        { "[t", todo.jump_next, desc = "Previous todo comment" },
        { "]", group = "next" },
        { "]t", todo.jump_prev, desc = "Next todo comment" },
        { '<leader>ae', '<cmd>AerialToggle<CR>', desc = "Toggle Aerial"},
        { '<leader>m', group = "molten"},
        { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator"},
        { "<leader>mo", ":noautocmd MoltenEnterOutput<CR> :noautocmd MoltenEnterOutput<CR>", desc = "Enter Output Window"},
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
        -- Top Pickers & Explorer
        { "<leader><space>", function() snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>e", function() snacks.explorer() end, desc = "File Explorer" },
        -- find
        { "<leader>fb", function() snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() snacks.picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>gb", function() snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- Grep
        { "<leader>sb", function() snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() snacks.picker.registers() end, desc = "Registers" },
        { '<leader>s/', function() snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sa", function() snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sb", function() snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sc", function() snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>sh", function() snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>si", function() snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sp", function() snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() snacks.picker.resume() end, desc = "Resume" },
        { "<leader>su", function() snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
        { "gd", function() snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- DAP
        { "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() dap.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() dap.continue() end, desc = "Run/Continue" },
        { "<leader>dC", function() dap.run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>dg", function() dap.goto_() end, desc = "Go to Line (No Execute)" },
        { "<leader>dl", function() dap.run_last() end, desc = "Run Last" },
        { "<leader>dP", function() dap.pause() end, desc = "Pause" },
        { "<leader>dr", function() dap.repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>ds", function() dap.session() end, desc = "Session" },
        { "<leader>dt", function() dap.terminate() end, desc = "Terminate" },
        { "<leader>dw", function() dap.ui.widgets.hover() end, desc = "Widgets" },
        { "<leader>du", function() dapui.toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() dapui.eval() end, desc = "Eval", mode = {"n", "v"} },
        { "<M-i>", function() dap.step_into() end, desc = "Step Into" },
        { "<M-o>", function() dap.step_over() end, desc = "Step Over" },
        { "<M-e>", function() dap.step_out() end, desc = "Step Out" },
        { "<leader>dj", function() dap.down() end, desc = "Down" },
        { "<leader>dk", function() dap.up() end, desc = "Up" },
      })
    end
  },
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        -- your bigfile configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'quarto', 'codecompanion'},
  },
  {
    'windwp/nvim-autopairs',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require('nvim-autopairs').setup{
        check_ts = true,
        ts_config = {
          python = {'import_from_statement'}
        },
        disable_filetype = {'codecompanion', 'snacks_picker_input'}
      }
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
  'folke/todo-comments.nvim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
}
