local editor = {}
local conf = require('kobra.modules.config.editor')

editor[#editor+1] = 'tpope/vim-sleuth'
editor[#editor+1] = 'tpope/vim-repeat'

editor[#editor+1] = {
  'windwp/nvim-ts-autotag',
  event = 'BufReadPre',
  config = conf.autotag,
}

editor[#editor+1] = {
  'numToStr/Comment.nvim',
  event = 'BufReadPre',
  config = conf.comment,
}

editor[#editor+1] = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  event = 'BufReadPre',
  dependencies = {
    'Comment.nvim',
  },
  config = conf.commentstring,
}

editor[#editor+1] = {
  'editorconfig/editorconfig-vim',
  config = conf.editorconfig,
}

editor[#editor+1] = {
  'ggandor/leap.nvim',
  event = 'BufReadPre',
  config = conf.leap,
}

editor[#editor+1] = {
  'declancm/cinnamon.nvim',
  event = 'BufReadPre',
  config = conf.cinnamon,
}

editor[#editor+1] = {
  'beauwilliams/focus.nvim',
  config = conf.focus,
}

editor[#editor+1] = {
  'airblade/vim-rooter',
  config = conf.rooter,
}

return editor
