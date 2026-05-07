vim.g.python3_host_prog = vim.fn.expand("~/miniforge3/envs/nvim/bin/python3")
local conda_bin = vim.fn.expand("~/miniforge3/envs/nvim/bin")
if vim.fn.isdirectory(conda_bin) == 1 and not string.find(vim.env.PATH or "", conda_bin, 1, true) then
  vim.env.PATH = conda_bin .. ":" .. (vim.env.PATH or "")
end

return {
  {
    "benlubas/molten-nvim",
    event = "BufReadCmd *.ipynb",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "snacks.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true

      -- Toggle molten virt-text behavior when leaving an .ipynb buffer for a .py
      -- (jove keeps `# %%` cell markers, so virt_lines_off_by_1 must stay true on .ipynb).
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.py",
        callback = function(e)
          if string.match(e.file, ".otter.") then
            return
          end
          if vim.fn.exists("*MoltenUpdateOption") == 1 then
            local ok, status = pcall(require, "molten.status")
            if ok and status.initialized() == "Molten" then
              vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
              vim.fn.MoltenUpdateOption("virt_text_output", false)
            else
              vim.g.molten_virt_lines_off_by_1 = false
              vim.g.molten_virt_text_output = false
            end
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.qmd", "*.md", "*.ipynb" },
        callback = function(e)
          if string.match(e.file, ".otter.") then
            return
          end
          if vim.fn.exists("*MoltenUpdateOption") == 1 then
            local ok, status = pcall(require, "molten.status")
            if ok and status.initialized() == "Molten" then
              vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
              vim.fn.MoltenUpdateOption("virt_text_output", true)
            else
              vim.g.molten_virt_lines_off_by_1 = true
              vim.g.molten_virt_text_output = true
            end
          end
        end,
      })
    end,
  },
  {
    "nghiant03/jove.nvim",
    lazy = false,
    priority = 100,
    dependencies = { "benlubas/molten-nvim" },
    opts = {
      auto_kernel = true,
      auto_import_outputs = true,
      auto_export_outputs = true,
      keymap = {
        run_cell = "<localleader>x",
        next_cell = "]h",
        prev_cell = "[h",
      },
    },
  },
}
