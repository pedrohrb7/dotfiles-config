return {
  -- ZitchDog theme
  {
    'theamallalgi/zitchdog',
    lazy = false,
    priority = 1000,
  },
  -- Onedark theme
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup({
        colors = {
          cursorline = '#FF0000', -- This is optional. The default cursorline color is based on the background
        },
        options = {
          cursorline = false,
          transparency = false,
          lualine_transparency = false,
        },
        highlights = {
          Comment = { italic = true },
          Directory = { bold = true },
          ErrorMsg = { italic = true, bold = true },
        },
      })
      -- vim.cmd.colorscheme "onedark"
    end,
  },

  -- Rose Pine theme
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- Moonfly theme
  -- vim.cmd [[colorscheme moonfly]]
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },

  -- cyberdream theme
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup({
        -- Enable transparent background
        transparent = false,
        -- Enable italics comments
        italic_comments = true,
      })
      -- vim.cmd.colorscheme 'cyberdream'
    end,
  },

  -- Fluormachine theme
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require('fluoromachine')

      fm.setup({
        glow = true,
        theme = 'fluoromachine',
        transparent = false,
      })

      -- vim.cmd.colorscheme 'fluoromachine'
    end,
  },

  -- Github theme
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({})

      -- vim.cmd('colorscheme github_dark')
    end,
  },

  -- Solarized theme
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup({
        transparent = {
          enabled = true,
        },
        variant = 'spring',
        error_lens = {
          text = true,
          symbol = true,
        },
        styles = {
          comments = { italic = true, bold = true },
          functions = { italic = true },
          variables = { italic = true },
        },
      })
    end,
  },

  -- Tokyonight theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      local tkn = require('tokyonight')
      tkn.setup({
        style = 'storm',
        transparent = true,
        styles = {
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'transparent', -- style for sidebars, see below
          -- floats = 'transparent', -- style for floating windows
          comments = { italic = true, bold = true },
          functions = { italic = true },
          variables = { italic = true },
        },
      })
    end,
  },

  -- Nord theme
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup({})
    end,
  },

  -- Black metal theme
  {
    'metalelf0/base16-black-metal-scheme',
  },
}
