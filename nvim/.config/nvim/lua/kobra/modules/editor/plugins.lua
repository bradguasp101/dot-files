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
}

editor['numToStr/Comment.nvim'] = {
  opt = true,
  config = conf.comment,
}

editor['JoosepAlviste/nvim-ts-context-commentstring'] = {
  opt = true,
  after = 'Comment.nvim',
  config = conf.commentstring,
}

editor['editorconfig/editorconfig-vim'] = {
  config = conf.editorconfig,
}

editor['ggandor/leap.nvim'] = {
  config = conf.leap,
}

editor['declancm/cinnamon.nvim'] = {
  config = conf.cinnamon,
}

editor['beauwilliams/focus.nvim'] = {
  config = conf.focus,
}

return editor
