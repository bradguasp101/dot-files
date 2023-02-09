local tools = {}
local conf = require('kobra.modules.tools.config')

tools[#tools+1] = {
  'jardnsm/vim-import-cost',
  cmd = { 'ImportCost', 'ImportCostClear' },
}

tools[#tools+1] = {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  setup = conf.telescope_setup,
  config = conf.telescope,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.vnim', build = 'make' },
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-project.nvim',
    'cljoly/telescope-repo.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'ahmedkhalf/project.nvim',
  },
}

tools[#tools+1] = {
  'ahmedkhalf/project.nvim',
  config = conf.project,
}

tools[#tools+1] = {
  'folke/neodev.nvim',
  ft = { 'lua' },
  config = conf.neodev,
}

tools[#tools+1] = {
  'danymat/neogen',
  event = 'BufReadPre',
  config = conf.neogen,
}

tools[#tools+1] = {
  'ThePrimeagen/refactoring.nvim',
  config = conf.refactor,
}

tools[#tools+1] = {
  'm-demare/hlargs.nvim',
  event = 'BufReadPre',
  config = conf.hlargs,
}

tools[#tools+1] = {
  'lewis6991/gitsigns.nvim',
  config = conf.gitsigns,
}

tools[#tools+1] = {
  'akinsho/git-conflict.nvim',
  config = conf.git_conflict,
}

tools[#tools+1] = {
  'tpope/vim-fugitive',
  cmd = { 'Gvsplit', 'Git', 'Gedit', 'Gstatus', 'Gdiffsplit', 'Gvdiffsplit', 'Flog', 'Flogsplit' },
}

tools[#tools+1] = {
  'shumphrey/fugitive-gitlab.vim',
  config = conf.fugitive_gitlab,
}

tools[#tools+1] = 'tpope/vim-rhubarb'
tools[#tools+1] = 'f-person/git-blame.nvim'
tools[#tools+1] = 'kdheepak/lazygit.nvim'

tools[#tools+1] = {
  'akinsho/toggleterm.nvim',
  config = conf.toggleterm,
  keys = { '<C-\\>' },
}

tools[#tools+1] = {
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DB' },
  dependencies = {
    { 'tpope/vim-dadbod', ft = { 'sql' } },
  },
  config = conf.dadbod,
}

tools[#tools+1] = 'dstein64/vim-startuptime'

tools[#tools+1] = {
  'davidgranstrom/nvim-markdown-preview',
  cmd = { 'MarkdownPreview' },
  ft = { 'markdown' },
}

tools[#tools+1] = {
  'Pocco81/AbbrevMan',
  config = conf.abbrevman,
}

tools[#tools+1] = {
  'jackMort/ChatGPT.nvim',
  cmd = { 'ChatGPT', 'ChatGPTActAs', 'ChatGPTEditWithInstructions' },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = conf.chatgpt,
}

return tools
