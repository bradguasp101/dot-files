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

core['nvim-treesitter/nvim-treesitter-context'] = {
  opt = true,
}

core['nvim-treesitter/playground'] = {
  opt = true,
  cmd = 'TSPlaygroundToggle',
  config = ts.playground,
}

core['folke/which-key.nvim'] = {
  opt = true,
  config = require('kobra.modules.core.whichkey').setup,
}

return core
