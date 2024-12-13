return {
  -- Jupyter
  {
    'GCBallesteros/jupytext.nvim',
    config = true,
    lazy = false
  },
  'GCBallesteros/NotebookNavigator.nvim',
  -- Enhancement
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
