vim.g.python3_host_prog = vim.fn.expand("$XDG_DATA_HOME/miniforge3/envs/nvim/bin/python3")
local conda_bin = vim.fn.expand("$XDG_DATA_HOME/miniforge3/envs/nvim/bin")
if vim.fn.isdirectory(conda_bin) == 1 and not string.find(vim.env.PATH or "", conda_bin, 1, true) then
  vim.env.PATH = conda_bin .. ":" .. (vim.env.PATH or "")
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
