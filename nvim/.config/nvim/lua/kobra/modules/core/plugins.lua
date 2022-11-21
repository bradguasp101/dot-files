local core = {}
local conf = require('kobra.modules.core.config')
local ts = require('kobra.modules.core.treesitter')

core['nvim-lua/plenary.nvim'] = {
  opt = true,
}

core['ray-x/guihua.lua'] = {
  opt = true,
  run = 'cd lua/fzy && make',
}

core['nvim-treesitter/nvim-treesitter'] = {
  opt = true,
  run = ':TSUpdate',
  config = ts.treesitter,
}

core['nvim-treesitter/nvim-treesitter-textobjects'] = {
  opt = true,
  config = ts.textobjects,
}

core['RRethy/nvim-treesitter-textsubjects'] = {
  opt = true,
  config = ts.textsubjects,
}

core['nvim-treesitter/nvim-treesitter-refactor'] = {
  opt = true,
  after = 'nvim-treesitter-textobjects',
  config = ts.refactor,
}

core['windwp/nvim-ts-autotag'] = {
  opt = true,
  config = conf.autotag,
}

core['JoosepAlviste/nvim-ts-context-commentstring'] = {
  opt = true,
  after = 'Comment.nvim',
  config = conf.commentstring,
}

return core
