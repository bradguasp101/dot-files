local tools = {}
local conf = require('kobra.modules.config.tools.config')

tools[#tools+1] = {
  'yardnsm/vim-import-cost',
  cmd = { 'ImportCost', 'ImportCostClear' },
}

tools[#tools+1] = {
  'folke/neodev.nvim',
  ft = { 'lua' },
  config = conf.neodev,
}

tools[#tools+1] = {
  'danymat/neogen',
  cmd = { 'Neogen' },
  config = conf.neogen,
}

tools[#tools+1] = {
  'ThePrimeagen/refactoring.nvim',
  lazy = true,
  config = conf.refactor,
}

tools[#tools+1] = {
  'm-demare/hlargs.nvim',
  event = 'BufRead',
  config = conf.hlargs,
}

tools[#tools+1] = {
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  cmd = { 'Gitsigns' },
  config = conf.gitsigns,
}

tools[#tools+1] = {
  'akinsho/git-conflict.nvim',
  cmd = {
    'GitConflictChooseOurs',
    'GitConflictChooseTheirs',
    'GitConflictChooseBoth',
    'GitConflictChooseNone',
    'GitConflictNextConflict',
    'GitConflictPrevConflict',
    'GitConflictListQf',
  },
  config = conf.git_conflict,
}

tools[#tools+1] = {
  'tpope/vim-rhubarb',
  cmd = { 'GBrowse' },
}

tools[#tools+1] = {
  'f-person/git-blame.nvim',
  event = 'BufEnter',
}

tools[#tools+1] = {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit' },
}

tools[#tools+1] = {
  'akinsho/toggleterm.nvim',
  event = 'TermOpen',
  cmd = { 'TermExec' },
  keys = { '<C-\\>' },
  config = conf.toggleterm,
}

tools[#tools+1] = {
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DB' },
  dependencies = {
    { 'tpope/vim-dadbod', ft = { 'sql' } },
  },
  config = conf.dadbod,
}

tools[#tools+1] = {
  'davidgranstrom/nvim-markdown-preview',
  cmd = { 'MarkdownPreview' },
  ft = { 'markdown' },
}

tools[#tools+1] = {
  'Pocco81/abbrev-man.nvim',
  event = 'InsertEnter',
  cmd = { 'AMLoad', 'AMUnload' },
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

tools[#tools+1] = {
  'ray-x/sad.nvim',
  config = conf.sad,
}

tools[#tools+1] = {
  'axkirillov/easypick.nvim',
  cmd = { 'Easypick' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = conf.easypick,
}

tools[#tools+1] = {
  'ruifm/gitlinker.nvim',
  keys = { '<leader>gy' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = conf.gitlinker,
}

return tools
