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
      keymap = {
        preset = "default",
        ["<Tab>"] = {
          "snippet_forward",
          function() return require("sidekick").nes_jump_or_apply() end,
          "fallback",
        },
      },
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
