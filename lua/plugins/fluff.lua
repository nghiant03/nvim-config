if vim.g.is_server then
    return {}
end

return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
  },
}
