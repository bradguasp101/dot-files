local editor = {}
local conf = require('kobra.modules.config.editor.config')

editor[#editor+1] = {
  'stevearc/oil.nvim',
  cmd = { 'Oil' },
  config = conf.oil,
}

editor[#editor+1] = {
  'tpope/vim-sleuth',
  event = 'BufReadPre',
}

editor[#editor+1] = {
  'tpope/vim-repeat',
  keys = { '.' },
}

editor[#editor+1] = {
  'windwp/nvim-ts-autotag',
  keys = { '<', '>' },
  config = conf.autotag,
}

editor[#editor+1] = {
  'numToStr/Comment.nvim',
  keys = {
    { 'gc', mode = { 'n', 'v' } },
    { 'gcc', mode = { 'n', 'v' } },
    { 'gbc', mode = { 'n', 'v' } },
  },
  config = conf.comment,
}

editor[#editor+1] = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  keys = {
    { 'gc', mode = { 'n', 'v' } },
    { 'gcc', mode = { 'n', 'v' } },
    { 'gbc', mode = { 'n', 'v' } },
  },
  dependencies = {
    'Comment.nvim',
  },
  config = conf.commentstring,
}

editor[#editor+1] = {
  'editorconfig/editorconfig-vim',
  event = 'VimEnter',
  config = conf.editorconfig,
}

editor[#editor+1] = {
  'ggandor/leap.nvim',
  keys = { 's', 'S' },
  config = conf.leap,
}

editor[#editor+1] = {
  'declancm/cinnamon.nvim',
  keys = { '<C-d>', '<C-u>' },
  config = conf.cinnamon,
}

editor[#editor+1] = {
  'sindrets/winshift.nvim',
  cmd = { 'WinShift' },
  config = conf.winshift,
}

editor[#editor+1] = {
  'LeonHeidelbach/trailblazer.nvim',
  cmd = {
    'TrailBlazerNewTrailMark',
    'TrailBlazerTrackBack',
    'TrailBlazerPeekMovePreviousUp',
    'TrailBlazerPeekMoveNextDown',
    'TrailBlazerMoveToNearest',
    'TrailBlazerMoveToTrailMarkCursor',
    'TrailBlazerDeleteAllTrailMarks',
    'TrailBlazerPasteAtLastTrailMark',
    'TrailBlazerPasteAtAllTrailMarks',
    'TrailBlazerTrailMarkSelectMode',
    'TrailBlazerToggleTrailMarkList',
    'TrailBlazerOpenTrailMarkList',
    'TrailBlazerCloseTrailMarkList',
    'TrailBlazerSwitchTrailMarkStack',
    'TrailBlazerAddTrailMarkStack',
    'TrailBlazerDeleteTrailMarkStacks',
    'TrailBlazerDeleteAllTrailMarkStacks',
    'TrailBlazerSwitchNextTrailMarkStack',
    'TrailBlazerSwitchPreviousTrailMarkStack',
    'TrailBlazerSetTrailMarkStackSortMode',
    'TrailBlazerSaveSession',
    'TrailBlazerLoadSession',
    'TrailBlazerDeleteSession',
  },
  config = conf.trailblazer,
}

-- editor[#editor+1] = {
--   'shellRaining/hlchunk.nvim',
--   config = conf.hlchunk,
-- }

return editor
