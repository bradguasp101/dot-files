local lang = {}
local conf = require('kobra.modules.lang.config')

lang['williamboman/mason.nvim'] = {
  opt = true,
  cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
}

lang['williamboman/mason-lspconfig.nvim'] = {
  opt = true,
  after = 'mason.nvim',
}

lang['neovim/nvim-lspconfig'] = {
  opt = true,
  after = 'mason-lspconfig.nvim',
}

lang['jose-elias-alvarez/null-ls.nvim'] = {
  opt = true,
  after = 'nvim-lspconfig',
}

lang['jayp0521/mason-null-ls.nvim'] = {
  opt = true,
  after = 'null-ls.nvim',
  config = conf.mason,
}

lang['RRethy/vim-illuminate'] = {
  opt = true,
  module = 'mason.nvim',
}

lang['j-hui/fidget.nvim'] = {
  opt = true,
  config = conf.fidget,
  module = 'lspconfig',
}

lang['ray-x/lsp_signature.nvim'] = {
  opt = true,
  config = conf.signature,
}

lang['simrat39/symbols-outline.nvim'] = {
  opt = true,
  config = conf.symbols_outline,
  event = 'BufReadPre',
}

lang['ray-x/go.nvim'] = {
  opt = true,
  ft = { 'go', 'go.mod' },
  module = { 'go' },
  config = conf.go,
}

lang['NTBBloodbath/rest.nvim'] = {
  opt = true,
  ft = { 'http' },
  config = conf.rest,
}

lang['fladson/vim-kitty'] = {
  opt = true,
  ft = { 'conf' },
}

return lang
