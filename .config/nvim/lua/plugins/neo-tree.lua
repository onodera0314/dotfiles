return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'main',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { '<C-e>', '<Cmd>Neotree toggle<CR>', desc = 'NeoTree' }
  }
}
