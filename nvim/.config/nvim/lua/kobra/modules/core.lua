local core = {}
local conf = require('kobra.modules.config.core.config')
local ts = require('kobra.modules.config.core.treesitter')

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
  'nvim-treesitter/nvim-treesitter',
  event = 'BufReadPre',
  build = ':TSUpdate',
  config = ts.treesitter,
}

core[#core+1] = {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufRead',
}

core[#core+1] = {
  'nvim-treesitter/playground',
  cmd = 'TSPlaygroundToggle',
  config = ts.playground,
}

core[#core+1] = {
  'folke/which-key.nvim',
  keys = { "<leader>" },
  config = require('kobra.modules.config.core.whichkey').setup,
}

core[#core+1] = {
  'max397574/better-escape.nvim',
  event = 'InsertEnter',
  config = conf.better_escape,
}

core[#core+1] = {
  'nvim-telescope/telescope.nvim',
  version = '0.1.1',
  lazy = true,
  config = require('kobra.modules.config.core.telescope').setup,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-z.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'cljoly/telescope-repo.nvim',
    'ahmedkhalf/project.nvim',
  },
}

core[#core+1] = {
  'ahmedkhalf/project.nvim',
  lazy = true,
  config = conf.project,
}

core[#core+1] = {
  'jedrzejboczar/possession.nvim',
  cmd = {
    'PossessionSave',
    'PossessionLoad',
    'PossessionClose',
    'PossessionDelete',
    'PossessionShow',
    'PossessionList',
    'PossessionMigrate',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = conf.possession,
}

return core
