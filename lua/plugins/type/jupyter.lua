vim.g.python3_host_prog=vim.fn.expand("~/miniforge3/envs/nvim/bin/python3")
return {
  {
    "benlubas/molten-nvim",
    event = "BufReadCmd *.ipynb",
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "snacks.nvim"
      vim.g.molten_output_win_max_height = 20
      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      vim.g.molten_auto_open_output = false

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true

			-- automatically import output chunks from a jupyter notebook
			-- tries to find a kernel that matches the kernel in the jupyter notebook
			-- falls back to a kernel that matches the name of the active venv (if any)
			local imb = function(e) -- init molten buffer
					vim.schedule(function()
							local kernels = vim.fn.MoltenAvailableKernels()
							local try_kernel_name = function()
									local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
									return metadata.kernelspec.name
							end
							local kernel_name = nil
							local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
							if venv ~= nil then
									kernel_name = string.match(venv, "/.+/(.+)")
							else
								local ok, name = pcall(try_kernel_name)
								if ok then kernel_name = name end
							end
							if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
									vim.cmd(("MoltenInit %s"):format(kernel_name))
							end
							vim.cmd("MoltenImportOutput")
					end)
			end

			-- automatically import output chunks from a jupyter notebook
			vim.api.nvim_create_autocmd("BufAdd", {
					pattern = { "*.ipynb" },
					callback = imb,
			})

			-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
			vim.api.nvim_create_autocmd("BufEnter", {
					pattern = { "*.ipynb" },
					callback = function(e)
							if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
									imb(e)
							end
					end,
			})

			-- change the configuration when editing a python file
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*.py",
				callback = function(e)
					if string.match(e.file, ".otter.") then
						return
					end
					if vim.fn.exists('*MoltenUpdateOption') == 1 then
						local ok, status = pcall(require, "molten.status")
						if ok and status.initialized() == "Molten" then -- this is kinda a hack...
							vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
							vim.fn.MoltenUpdateOption("virt_text_output", false)
						else
							vim.g.molten_virt_lines_off_by_1 = false
							vim.g.molten_virt_text_output = false
						end
					end
				end,
			})

			-- Undo those config changes when we go back to a markdown or quarto file
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = { "*.qmd", "*.md", "*.ipynb" },
				callback = function(e)
					if string.match(e.file, ".otter.") then
						return
					end

					if vim.fn.exists('*MoltenUpdateOption') == 1 then
						local ok, status = pcall(require, "molten.status")
						if ok and status.initialized() == "Molten" then
							vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
							vim.fn.MoltenUpdateOption("virt_text_output", true)
						else
							vim.g.molten_virt_lines_off_by_1 = true
							vim.g.molten_virt_text_output = true
						end
					end
				end,
			})
    end,
  },
  {
    'GCBallesteros/jupytext.nvim',
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
    config = true,
    lazy = false
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = {"quarto", "markdown"},
    config = function()
      local quarto = require("quarto")
      quarto.setup({
        lspFeatures = {
          languages = { "python", "rust", "lua" },
          chunks = "all", -- 'curly' or 'all'
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = "H",
          definition = "gd",
          rename = "<leader>rn",
          references = "gr",
          format = "<leader>gf",
        },
        codeRunner = {
          enabled = true,
          ft_runners = {
            bash = "slime",
          },
          default_method = "molten",
        },
      })
    end
  },
  {
    "jmbuhr/otter.nvim",
    ft = { "markdown", "quarto"}
  },
}
