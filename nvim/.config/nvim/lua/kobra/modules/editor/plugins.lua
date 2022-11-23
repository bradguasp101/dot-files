local editor = {}
local conf = require('kobra.modules.editor.config')

editor['tpope/vim-sleuth'] = {}
editor['tpope/vim-repeat'] = {}

editor['jdhao/better-escape.vim'] = {
  event = 'InsertEnter',
}

editor['windwp/nvim-ts-autotag'] = {
  opt = true,
  config = conf.autotag,
  event = 'BufReadPre',
}

editor['numToStr/Comment.nvim'] = {
  opt = true,
  config = conf.comment,
  event = 'BufReadPre',
}

editor['JoosepAlviste/nvim-ts-context-commentstring'] = {
  opt = true,
  after = 'Comment.nvim',
  config = conf.commentstring,
  event = 'BufReadPre',
}

editor['editorconfig/editorconfig-vim'] = {
  config = conf.editorconfig,
}

editor['ggandor/leap.nvim'] = {
  opt = true,
  config = conf.leap,
  event = 'BufReadPre',
}

editor['declancm/cinnamon.nvim'] = {
  opt = true,
  config = conf.cinnamon,
  event = 'BufReadPre',
}

editor['beauwilliams/focus.nvim'] = {
  config = conf.focus,
}

return editor
