return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "kawre/neotab.nvim",
      "zbirenbaum/copilot.lua",
      "fang2hou/blink-copilot",
    },
    opts = {
      -- C-y accepts, C-n/C-p navigate, Tab/S-Tab jump through snippets.
      -- Tab falls back to neotab when no snippet jump is available.
      keymap = { preset = "default" },
      snippets = { preset = "luasnip" },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "Copilot",
            module = "blink-copilot",
            async = true,
          },
        },
      },
      cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },
}
