return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<CR>' },
    { '<leader>b', '<Cmd>Telescope buffers<CR>' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>' }
  }
}
