vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    local current_path = vim.fn.expand('%:p')
    local current_dir = vim.fn.isdirectory(current_path) == 1 and current_path or vim.fn.expand('%:p:h')

    if current_dir ~= vim.fn.getcwd() then
      vim.cmd('cd ' .. current_dir)
    end
  end
})
