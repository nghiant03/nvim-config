local venv_bin = vim.fn.expand("$XDG_CONFIG_HOME/nvim/.venv/bin")
if vim.fn.isdirectory(venv_bin) == 1 and not string.find(vim.env.PATH or "", venv_bin, 1, true) then
  vim.env.PATH = venv_bin .. ":" .. (vim.env.PATH or "")
end

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
      keymap = {
        run_cell        = "<localleader>jc",
        run_and_advance = "<localleader>jx",
        run_selection   = "<localleader>jv",
        next_cell       = "]h",
        prev_cell       = "[h",
      },
    },
  },
}
