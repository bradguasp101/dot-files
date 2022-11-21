local lang = {}
local conf = require('kobra.modules.lang.config')

lang['j-hui/fidget.nvim'] = {
  opt = true,
  config = conf.fidget,
  module = 'lspconfig',
}

lang['ray-x/navigator.lua'] = {
  opt = true,
  requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  config = conf.navigator,
}

lang['jose-elias-alvarez/null-ls.nvim'] = {
  opt = true,
  config = require('kobra.modules.lang.null').config,
}

lang['simrat39/symbols-outline.nvim'] = {
  opt = true,
  config = conf.symbols_outline,
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
