return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  lazy = false,
  config = function()
    local mason = require('mason')
    local mson_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup({
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    local servers = mson_lspconfig.setup({
      ensure_installed = {
        'jsonls',
        'lua_ls',
        'ts_ls',
        'terraformls',
        'dockerls',
        'tailwindcss',
        'cssls',
        'sqls',
        'terraformls',
        'dockerls',
        'eslint',
        'kotlin_language_server',
      },

      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'pylint',
        'cssls',
        'ktlint',
        'lua-language-server',
        'editorconfig-checker',
        { 'eslint_d', version = '13.1.2' },
      },
    })
  end,
}
