local lang = {}
local conf = require('kobra.modules.lang.config')

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
  event = 'BufReadPre',
}

lang[#lang+1] = {
  'j-hui/fidget.nvim',
  event = 'BufReadPre',
  config = conf.fidget,
  disabled = true,
}

lang[#lang+1] = {
  'ray-x/lsp_signature.nvim',
  event = 'BufReadPre',
  config = conf.signature,
}

lang[#lang+1] = {
  'RishabhRD/nvim-lsputils',
  event = 'BufReadPre',
  dependencies = {
    'RishabhRD/popfix',
  },
  config = conf.lsputils,
}

lang[#lang+1] = {
  'simrat39/symbols-outline.nvim',
  event = 'BufReadPre',
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
