return {
  'folke/tokyonight.nvim',
  lazy = false,
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent"
    }
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight-moon]])
    -- 背景を透過
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
