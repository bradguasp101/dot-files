local completion = {}
local conf = require('kobra.modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  opt = true,
  config = conf.nvim_lsp,
}

completion['hrsh7th/nvim-cmp'] = {
  after = { 'LuaSnip' },
  requires = {
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-calc', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-emoji', after = 'nvim-cmp', opt = true },
    { 'ray-x/cmp-treesitter', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', opt = true },
    { 'f3fora/cmp-spell', after = 'nvim-cmp', opt = true },
    { 'octaltree/cmp-look', after = 'nvim-cmp', opt = true },
    { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } },
  },
  config = conf.nvim_cmp,
}

completion['L3MON4D3/LuaSnip'] = {
  event = 'InsertEnter',
  requires = { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
  config = function() require('kobra.modules.completion.luasnip') end,
}

completion['ray-x/lsp_signature.nvim'] = {
  opt = true,
  config = conf.lsp_signature,
}

completion['windwp/nvim-autopairs'] = {
  opt = true,
  config = conf.autopairs,
}

completion['andymass/vim-matchup'] = {
  opt = true,
  config = conf.matchup,
}

completion['RRethy/nvim-treesitter-endwise'] = {
  opt = true,
  config = conf.endwise,
}

completion['kristijanhusak/vim-dadbod-completion'] = {}

return completion
