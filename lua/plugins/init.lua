return {
  -- LaTeX
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
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
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    opts = {
      rocks = { "magick" },
    },
    config = true,
  },
  {
    'echasnovski/mini.nvim',
    version = "*",
    config = function()
      require('mini.icons').setup()
    end
  },
  -- Practice
  'ThePrimeagen/vim-be-good',
}
