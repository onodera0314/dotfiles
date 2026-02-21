return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'lua',
      'ruby',
      'javascript',
      'rust',
      'go',
      'markdown',
      'terraform',
      'vim',
      'vimdoc'
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}
