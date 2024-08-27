return {
  'ghifarit53/tokyonight-vim',
  lazy = false,
  config = function()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_disable_italic_comment = 1
    vim.cmd([[colorscheme tokyonight]])
  end
}
