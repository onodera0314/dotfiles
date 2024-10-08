return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'ruby',
        'javascript',
        'rust',
        'go',
        'markdown',
        'terraform',
        'vim',
        'vimdoc'
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      }
    })
  end
}
