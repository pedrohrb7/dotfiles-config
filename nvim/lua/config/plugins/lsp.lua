return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = 'Show LSP references'
      keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

      opts.desc = 'Go to declaration'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = 'Show LSP definitions'
      keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

      opts.desc = 'Show LSP implementations'
      keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

      opts.desc = 'Show LSP type definitions'
      keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

      opts.desc = 'See available code actions'
      keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = 'Smart rename'
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = 'Show buffer diagnostics'
      keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = 'Go to next diagnostic'
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = 'Show documentation for what is under cursor'
      keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      -- opts.desc = 'Show Signature Help for what is under cursor'
      -- keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)

      opts.desc = 'Restart LSP'
      keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    lspconfig['dockerls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- lspconfig['terraformls'].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    lspconfig['jsonls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['ts_ls'].setup({
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern('package.json'),
      single_file_support = false,
    })

    -- lspconfig['intelephense'].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   cmd = { 'intelephense', '--stdio' },
    --   filetypes = { 'php', 'blade' },
    --   root_pattern = { 'composer.json', '.git' },
    -- })
    -- lspconfig['tailwindcss'].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    -- lspconfig['volar'].setup({
    --   capabilities = capabilities,
    --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    --   init_options = {
    --     vue = {
    --       hybridMode = false,
    --     },
    --     typescript = {
    --       tsdk = '~/.local/share/lazynvim/mason/packages/vue-language-server/node_modules/typescript/lib/',
    --     },
    --   },
    -- })

    lspconfig['cssls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- lspconfig['graphql'].setup({
    --   capabilities = capabilities,
    --   filetypes = { 'graphql', 'gql', 'typescriptreact', 'javascriptreact' },
    -- })

    lspconfig['emmet_ls'].setup({
      capabilities = capabilities,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    })

    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    })
  end,
}