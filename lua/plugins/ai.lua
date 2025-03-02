return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "gemini",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
      adapter = {
        gemini = function()
          return require('codecompanion.adapter').extend('gemini', {
            schema = {
              maxOutputTokens = 256
            }
          })
        end
      }
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
    }
  },
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      provider = "codestral",
      add_single_line_entry = false,
      provider_options = {
        codestral = {
          optional = {
            max_tokens = 256,
            stop = { "\n\n" },
          },
        },
        gemini = {
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
            },
            safetySettings = {
              {
                -- HARM_CATEGORY_HATE_SPEECH,
                -- HARM_CATEGORY_HARASSMENT
                -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                category = "HARM_CATEGORY_DANGEROUS_CONTENT",
                -- BLOCK_NONE
                threshold = "BLOCK_ONLY_HIGH",
              },
            },
          },
        },
      },
    },
  },
}
