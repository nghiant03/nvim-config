return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>s", group = "search" },
        { "<leader>d", group = "debug" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>c", group = "code" },
        { "<leader>a", group = "ai" },
        { "<localleader>j", group = "jove" },
        { "<localleader>l", group = "latex" },
      },
    },
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
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
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
		keys = {
			{ "<leader>G", "<cmd>Neogit<cr>", desc = "Neogit" },
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
			remote = {
				copy_dirs = {
					config = {
						dirs = {"lua", "ftplugin", "init.lua"}, -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
					}
				}
			},
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
	{
		"linux-cultist/venv-selector.nvim",
		ft = "python", -- Load when opening Python files
		keys = { { "<localleader>v", "<cmd>VenvSelect<cr>", ft = "python", desc = "Python: Select Venv" } }, -- Open picker on keymap
		opts = {
			options = {}, -- plugin-wide options
			search = {}   -- custom search definitions
		},
	},
	"kevinhwang91/nvim-bqf",
  "kevinhwang91/nvim-hlslens",
  "vladdoster/remember.nvim",
  "folke/todo-comments.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ensure = {
        "python", "markdown", "markdown_inline", "yaml", "toml",
        "bash", "lua", "json", "rust", "html", "css", "javascript",
        "typescript", "vim", "vimdoc", "query", "c", "cpp",
      }
      local nts = require("nvim-treesitter")
      local installed = nts.get_installed("parsers")
      local missing = {}
      for _, lang in ipairs(ensure) do
        if not vim.tbl_contains(installed, lang) then
          table.insert(missing, lang)
        end
      end
      if #missing > 0 then
        nts.install(missing)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ensure,
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
