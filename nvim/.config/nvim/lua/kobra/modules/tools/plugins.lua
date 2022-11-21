local tools = {}
local conf = require('kobra.modules.tools.config')

tools['yardnsm/vim-import-cost'] = {
  opt = true,
  cmd = { 'ImportCost', 'ImportCostClear' },
}

tools['nvim-telescope/telescope.nvim'] = {
  opt = true,
  setup = conf.telescope_setup,
  config = conf.telescope,
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
    { 'nvim-telescope/telescope-live-grep-args.nvim', opt = true },
    { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
  },
}

tools['folke/neodev.nvim'] = {
  opt = true,
  config = conf.neodev,
}

tools['danymat/neogen'] = {
  opt = true,
  config = conf.neogen,
}

tools['ThePrimeagen/refactoring.nvim'] = {
  opt = true,
  config = conf.refactor,
}

tools['m-demare/hlargs.nvim'] = {
  opt = true,
  config = conf.hlargs,
}

tools['lewis6991/gitsigns.nvim'] = {
  opt = true,
  config = conf.gitsigns,
}

tools['akinsho/git-conflict.nvim'] = {
  opt = true,
  config = conf.git_conflict,
}

tools['tpope/vim-fugitive'] = {
  opt = true,
  cmd = { 'Gvsplit', 'Git', 'Gedit', 'Gstatus', 'Gdiffsplit', 'Gvdiffsplit', 'Flog', 'Flogsplit' },
}

tools['shumphrey/fugitive-gitlab.vim'] = {
  opt = true,
  config = conf.fugitive_gitlab,
}

tools['folke/trouble.nvim'] = {
  opt = true,
  config = conf.trouble,
}

return tools
