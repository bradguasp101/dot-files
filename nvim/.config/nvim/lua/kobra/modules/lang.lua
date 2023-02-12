local lang = {}
local conf = require('kobra.modules.config.lang.config')

lang[#lang+1] = {
  'williamboman/mason.nvim',
  cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
}

lang[#lang+1] = {
  'jayp0521/mason-null-ls.nvim',
  event = 'BufReadPre',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  },
  config = conf.mason,
}

lang[#lang+1] = {
  'RRethy/vim-illuminate',
  event = 'BufRead',
}

lang[#lang+1] = {
  'j-hui/fidget.nvim',
  event = 'BufReadPre',
  config = conf.fidget,
}

lang[#lang+1] = {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  config = conf.signature,
}

lang[#lang+1] = {
  'RishabhRD/nvim-lsputils',
  keys = { '<leader>l' },
  dependencies = {
    'RishabhRD/popfix',
  },
  config = conf.lsputils,
}

lang[#lang+1] = {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  config = conf.symbols_outline,
}

lang[#lang+1] = {
  'ray-x/go.nvim',
  ft = { 'go', 'go.mod' },
  config = conf.go,
}

lang[#lang+1] = {
  'NTBBloodbath/rest.nvim',
  ft = { 'http' },
  config = conf.rest,
}

lang[#lang+1] = {
  'fladson/vim-kitty',
  ft = { 'conf' },
}

return lang
