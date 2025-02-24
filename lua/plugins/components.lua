-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
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
  {
    'nvim-telescope/telescope.nvim',
    dependencies  = 'nvim-lua/plenary.nvim',
    opts = {
      defaults = {
        winblend = 25,
        wrap_results = true,
        path_display = {
        shorten = 5
        }
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
    'nvim-tree/nvim-tree.lua',
    opts = {
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = true,
      modified = {
        enable = true,
      },
      renderer = {
        highlight_opened_files = "name",
      },
      live_filter = {
        always_show_folders = false
      },
      update_focused_file = {
        enable = true,
      },
      actions = {
        change_dir = {
          global = true
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
