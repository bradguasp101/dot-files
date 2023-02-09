local core = {}
local conf = require('kobra.modules.core.config')
local ts = require('kobra.modules.core.treesitter')

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
  lazy = true,
  config = require('kobra.modules.core.whichkey').setup,
}

core[#core+1] = {
  'jdhao/better-escape.vim',
  event = 'InsertEnter',
  setup = conf.better_escape,
}

return core
