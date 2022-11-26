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
  ft = { 'lua' },
}

tools['danymat/neogen'] = {
  opt = true,
  config = conf.neogen,
  event = 'BufReadPre',
}

tools['ThePrimeagen/refactoring.nvim'] = {
  opt = true,
  config = conf.refactor,
}

tools['m-demare/hlargs.nvim'] = {
  opt = true,
  config = conf.hlargs,
  event = 'BufReadPre',
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

tools['tpope/vim-rhubarb'] = {
  opt = true,
}

tools['f-person/git-blame.nvim'] = {
  opt = true,
}

tools['kdheepak/lazygit.nvim'] = {
  opt = true,
}

tools['akinsho/toggleterm.nvim'] = {
  config = conf.toggleterm,
}

tools['kristijanhusak/vim-dadbod-ui'] = {
  opt = true,
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DB' },
  requires = { 'tpope/vim-dadbod', ft = { 'sql' } },
  config = conf.dadbod,
}

tools['dstein64/vim-startuptime'] = {}

tools['davidgranstrom/nvim-markdown-preview'] = {
  opt = true,
  cmd = { 'MarkdownPreview' },
  ft = { 'markdown' },
}

tools['Pocco81/AbbrevMan.nvim'] = {
  config = conf.abbrevman(),
}

tools['nvim-neorg/neorg'] = {
  opt = true,
  ft = 'norg',
  cmd = { 'Neorg', 'NeorgStart' },
  after = {
    'nvim-treesitter',
    'telescope.nvim',
  },
  config = conf.neorg,
}

return tools
