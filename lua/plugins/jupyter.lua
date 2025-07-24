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
