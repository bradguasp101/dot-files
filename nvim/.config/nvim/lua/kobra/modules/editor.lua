local editor = {}
local conf = require('kobra.modules.config.editor.config')

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
  keys = { 'gc', 'gcc', 'gbc' },
  config = conf.comment,
}

editor[#editor+1] = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  keys = { 'gc', 'gcc', 'gbc' },
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
  'beauwilliams/focus.nvim',
  event = 'BufRead',
  config = conf.focus,
}

editor[#editor+1] = {
  'airblade/vim-rooter',
  config = conf.rooter,
}

return editor
