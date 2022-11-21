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

core['jdhao/better-escape.vim'] = {
  opt = true,
  event = 'InsertEnter',
}

core['kyazdani42/nvim-web-devicons'] = {}

core['nvim-tree/nvim-tree.lua'] = {
  setup = conf.nvim_tree_setup,
  config = conf.nvim_tree,
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

core['nvim-treesitter/playground'] = {
  opt = true,
  cmd = 'TSPlaygroundToggle',
  config = ts.playground,
}

core['windwp/nvim-ts-autotag'] = {
  opt = true,
  config = conf.autotag,
}

core['numToStr/Comment.nvim'] = {
  opt = true,
  config = conf.comment,
}

core['JoosepAlviste/nvim-ts-context-commentstring'] = {
  opt = true,
  after = 'Comment.nvim',
  config = conf.commentstring,
}

core['folke/which-key.nvim'] = {
  opt = true,
  config = require('kobra.modules.core.whichkey').setup,
}

return core
