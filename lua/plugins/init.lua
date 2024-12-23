return {
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
