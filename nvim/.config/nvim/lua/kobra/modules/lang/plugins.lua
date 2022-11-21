local lang = {}
local conf = require('kobra.modules.lang.config')

lang['ray-x/navigator.lua'] = {
  opt = true,
  requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  config = conf.navigator,
}

lang['ray-x/go.nvim'] = {
  opt = true,
  ft = { 'go', 'go.mod' },
  module = { 'go' },
  config = conf.go,
}

lang['jose-elias-alvarez/null-ls.nvim'] = {
  opt = true,
  config = require('kobra.modules.lang.null').config,
}

lang['j-hui/fidget.nvim'] = {
  opt = true,
  config = conf.fidget,
  module = 'lspconfig',
}

return lang
