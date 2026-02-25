return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require("which-key")
      local snacks = require("snacks")
      local dap = ":lua require('dap')"
      local dapview = ":lua require('dap-view')"
      wk.add({
        { "<leader>t", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", desc = "Toggle Terminal" },
        { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "t" },
        { "<localleader>m", group = "molten"},
        { "<localleader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator"},
        { "<localleader>mo", ":noautocmd MoltenEnterOutput<CR>:noautocmd MoltenEnterOutput<CR>", desc = "Enter Output Window"},
        { "<localleader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Execute Visual Selection", mode = "v"},
				{ "<localleader>mi", ":MoltenInit<CR>", desc= "Initialize Kernel"},
        { "<localleader>mr", ":MoltenRestart<CR>", desc = "Restart Kernel"},
        { "<localleader>mc", ":MoltenHideOutput<CR>", desc = "Close Output Window"},
        { "<localleader>md", ":MoltenDelete<CR>", desc = "Delete Molten Cell"},
        { "<localleader>mx", ":MoltenOpenInBrowser<CR>", desc = "Open Output In Browser"},
        { "<localleader>q", group = "quarto"},
        { "<localleader>qc", ":QuartoSend<CR>", desc = "Run Cell" },
        { "<localleader>qa", ":QuartoSendAbove<CR>", desc = "Run Cell And Above" },
        { "<localleader>qb", ":QuartoSendBelow<CR>", desc = "Run Cell And Below"},
        { "<localleader>qA", ":QuartoSendAll<CR>", desc = "Run All Cells" },
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
        { "<leader>gf", function() snacks.picker.git_log_file() end, desc = "Git Log File" },
				{ "<leader>G", ":Neogit<CR>", desc = "Open Neogit"},
        -- Grep
        { "<leader>sb", function() snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>s\"", function() snacks.picker.registers() end, desc = "Registers" },
        { "<leader>s/", function() snacks.picker.search_history() end, desc = "Search History" },
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
        -- LSP
        { "gd", function() snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gR", function() snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- DAP
        { "<leader>dB", dap .. ".set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Breakpoint Condition" },
        { "<leader>db", dap .. ".toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
        { "<leader>dc", dap .. ".continue()<CR>", desc = "Run/Continue" },
        { "<leader>dC", dap .. ".run_to_cursor()<CR>", desc = "Run to Cursor" },
        { "<leader>dg", dap .. ".goto_()<CR>", desc = "Go to Line (No Execute)" },
        { "<leader>dl", dap .. ".run_last()<CR>", desc = "Run Last" },
        { "<leader>dP", dap .. ".pause()<CR>", desc = "Pause" },
        { "<leader>dr", dap .. ".repl.toggle()<CR>", desc = "Toggle REPL" },
        { "<leader>ds", dap .. ".session()<CR>", desc = "Session" },
        { "<leader>dt", dap .. ".terminate()<CR>", desc = "Terminate" },
        { "<leader>du", dapview .. ".toggle({ })<CR>", desc = "Dap UI" },
        { "<M-i>", dap .. ".step_into()<CR>", desc = "Step Into" },
        { "<M-o>", dap .. ".step_over()<CR>", desc = "Step Over" },
        { "<M-e>", dap .. ".step_out()<CR>", desc = "Step Out" },
        { "<leader>dj", dap .. ".down()<CR>", desc = "Down" },
        { "<leader>dk", dap .. ".up()<CR>", desc = "Up" },
        -- LaTeX
        { "<localleader>li", ":VimtexInfo<CR>", desc = "Vimtex Info"},
        { "<localleader>lc", ":VimtexCompile<CR>", desc = "Vimtex Compile"},
        { "<localleader>ls", ":VimtexStop<CR>", desc = "Vimtex Stop"},
        { "<localleader>lC", ":VimtexClean<CR>", desc = "Vimtex Clean All"},
        { "<localleader>lv", ":VimtexView<CR>", desc = "Vimtex View"},
        { "<localleader>lS", ":VimtexCompileSelected<CR>", desc = "Vimtex View"},
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
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto", "codecompanion"},
		opts = {
			enabled = false
		}
  },
	{
		"hat0uma/csvview.nvim",
		opts = {
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("nvim-autopairs").setup{
        check_ts = true,
        ts_config = {
          python = {"import_from_statement"}
        },
        disable_filetype = {"codecompanion", "snacks_picker_input"}
      }
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      -- configuration goes here
    },
  },
  {
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"folke/snacks.nvim",             -- optional
		},
		opts = {
			graph_style = "kitty"
		},
  },
	{
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
	},
	{
		'amitds1997/remote-nvim.nvim',
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			client_callback = function(port, _)
				vim.notify("Opening Kitty…", vim.log.levels.INFO, { title = "remote-nvim" })

				local cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
				vim.fn.jobstart(cmd, {
					detach = true,
					on_exit = function(job_id, exit_code, event_type)
						-- This function will be called when the job exits
						print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
					end,
				})
			end,
		},
		config = true
	},
	"kevinhwang91/nvim-bqf",
  "kevinhwang91/nvim-hlslens",
  "vladdoster/remember.nvim",
  "folke/todo-comments.nvim",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
