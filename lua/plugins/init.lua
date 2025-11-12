return {
  -- LaTeX
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_mappings_enabled = 0
      vim.g.vimtex_compiler_latexmk = {
        options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
        }
      }
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_quickfix_mode = 0
    end
  },
  -- Enhancement
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
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
						base = vim.fs.joinpath(vim.fn.expand("$XDG_CONFIG_HOME"), "remote-nvim"),
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
	}
}
