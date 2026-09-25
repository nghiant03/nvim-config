return {
  {
    "nghiant03/jove.nvim",
    lazy = false,
    priority = 100,
    opts = {
      auto_kernel = true,
      auto_import_outputs = true,
      auto_export_outputs = true,
      cell_motions = false,
      ui = {
        border_hl = { fg = "#ff9e64" },
      },
      lsp = {
        auto_attach = true,
        servers = {
          python = { "pyright" },
          javascript = { "ts_ls" },
          typescript = { "ts_ls" },
        },
      },
      keymap = {
        run_cell        			= "<localleader>jc",
        run_and_advance 			= "<localleader>jx",
        run_selection   			= "<localleader>jv",
        next_cell       			= "]h",
        prev_cell       			= "[h",
				toggle_follow_running = "<localleader>jf",
      },
    },
    keys = {
      { "<localleader>jk", function() require("jove.keymaps").run_above() end,        desc = "Jove: Run Above" },
      { "<localleader>ja", function() require("jove.keymaps").run_all() end,          desc = "Jove: Run All" },
      { "<localleader>ji", function() require("jove.kernel").init(0) end,             desc = "Jove: Init Kernel" },
      { "<localleader>js", function() require("jove.kernel").select(0) end,           desc = "Jove: Select Kernel" },
      { "<localleader>jC", function() require("jove.execute").interrupt(0) end,       desc = "Jove: Interrupt" },
      { "<localleader>jr", function() require("jove.kernel").restart(0) end,          desc = "Jove: Restart Kernel" },
      { "<localleader>jq", function() require("jove.kernel").shutdown(0) end,         desc = "Jove: Shutdown Kernel" },
      { "<localleader>jo", function() require("jove.output").toggle(0) end,           desc = "Jove: Toggle Output" },
      { "<localleader>jO", function() require("jove.output").open_float(0) end,       desc = "Jove: Open Output Float" },
      { "<localleader>jd", function() require("jove.output").clear_at_cursor(0) end,  desc = "Jove: Clear Output" },
      { "<localleader>jD", function() require("jove.output").clear(0) end,            desc = "Jove: Clear All Outputs" },
      { "<localleader>jR", function() require("jove.buffer").reload(0) end,           desc = "Jove: Reload Notebook" },
      { "<localleader>jb", function() require("jove.ui.sidebar").toggle(0) end,       desc = "Jove: Toggle Sidebar" },
    },
  },
}
