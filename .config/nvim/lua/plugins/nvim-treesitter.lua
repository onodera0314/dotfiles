return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'ruby',
        'javascript',
        'markdown',
        'terraform'
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
