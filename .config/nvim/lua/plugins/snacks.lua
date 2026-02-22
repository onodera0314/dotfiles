return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = { enabled = true },
    dashboard = { enabled = true },
    bufdelete = { enabled = true },
    indent = {
      enabled = true,

      ---@class snacks.indent.animate: snacks.animate.Config
      animate = {
        enabled = false,
      }
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end },
    { "<leader>fb", function() Snacks.picker.buffers() end },
    { "<leader>fr", function() Snacks.picker.recent() end },
    { "<leader>/", function() Snacks.picker.grep() end },
  }
}
