vim.opt.termguicolors = true

return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'tokyonight',
        icons_enabled = true,
        disabled_filetypes = {"NvimTree", "snacks_dashboard"},
      },
      sections = {
        lualine_a = {{
          'filename',
          path = 1,
        }},
        lualine_x = {"encoding", "fileformat"},
        lualine_y = {"filetype"},
        lualine_z = {"progress", "location"},
      }
    }
  },
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = 'float'
		}
	},
  {
    "folke/snacks.nvim",
    version = '*',
    opts = {
      explorer = {
        replace_netrw = true,
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
          }
        }
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 5,
      multiline_threshold = 2,
    }
  },
}
