local core = {}
local conf = require('kobra.config.core')
local ts = require('kobra.config.treesitter')

core[#core+1] = {
  'nvim-lua/plenary.nvim',
  lazy = true,
}

core[#core+1] = {
  'ray-x/guihua.lua',
  lazy = true,
  build = 'cd lua/fzy && make',
}

core[#core+1] = 'kyazdani42/nvim-web-devicons'

core[#core+1] = {
  'nvim-tree/nvim-tree.lua',
  config = conf.nvim_tree,
}

core[#core+1] = {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufReadPre',
  build = ':TSUpdate',
  config = ts.treesitter,
}

core[#core+1] = {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPre',
}

core[#core+1] = {
  'nvim-treesitter/playground',
  cmd = 'TSPlaygroundToggle',
  config = ts.playground,
}

core[#core+1] = {
  'folke/which-key.nvim',
  config = require('kobra.modules.config.whichkey').setup,
}

core[#core+1] = {
  'max397574/better-escape.nvim',
  event = 'InsertEnter',
  config = conf.better_escape,
}

return core
