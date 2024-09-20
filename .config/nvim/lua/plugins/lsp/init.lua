return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,
        }
      )
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'gopls'
        },
        automatic_installation = true
      })
    end,
    init = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end,
      })
    end
  },
}
