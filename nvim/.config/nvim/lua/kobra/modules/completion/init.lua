local completion = {}
local conf = require('kobra.modules.completion.config')

completion[#completion+1] = 'onsails/lspkind.nvim'

completion[#completion+1] = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'LuaSnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-emoji',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lsp',
    'f3fora/cmp-spell',
    'octaltree/cmp-look',
    'saadparwaiz1/cmp_luasnip',
  },
  config = conf.nvim_cmp,
}

completion[#completion+1] = {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function() require('kobra.modules.completion.luasnip') end,
}

completion[#completion+1] = {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.autopairs,
}

completion[#completion+1] = {
  'andymass/vim-matchup',
  event = 'BufReadPre',
  config = conf.matchup,
}

completion[#completion+1] = {
  'RRethy/nvim-treesitter-endwise',
  event = 'BufReadPre',
  config = conf.endwise,
}

completion[#completion+1] = 'kristijanhusak/vim-dadbod-completion'

return completion
