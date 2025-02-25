vim.opt.termguicolors = true

return {
  'mfussenegger/nvim-dap',
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
  'nvim-neotest/neotest',
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      autochdir = true,
      auto_scroll = true,
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
      },
    }
  },
  {
    "folke/snacks.nvim",
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
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require("nvim-treesitter.configs").setup({
        -- ... other ts config
        textobjects = {
          move = {
            enable = true,
            set_jumps = false, -- you can change this if you want.
          },
          select = {
            enable = true,
            lookahead = true, -- you can change this if you want
          },
          swap = { -- Swap only works with code blocks that are under the same
                   -- markdown header
            enable = true,
          },
        }
      })
    end
  }
}
