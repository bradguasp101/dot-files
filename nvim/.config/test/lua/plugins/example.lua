-- since this is just an example spec, don't actually load anything here and return an empty spec
if true then return {} end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim' },

  -- configure KobraVim to load gruvbox
  {
    'KobraKommander9/KobraVim',
    opts = {
      colorscheme = 'gruvbox',
    },
  },

  -- change trouble config
  {
    'folke/trouble.nvim',
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { 'folke/trouble.nvim', enabled = false },

  -- add symbols-outline
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'SymbolsOutline' } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
}
