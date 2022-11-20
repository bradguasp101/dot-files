local editor = {}
local conf = require('kobra.modules.editor.config')

editor['windwp/nvim-autopairs'] = {
  after = { 'nvim-cmp' },
  config = conf.autopairs,
  opt = true,
}

editor['ggandor/leap.nvim'] = {
  opt = true,
  module = 'leap',
  requires = {
    { 'tpope/vim-repeat' },
  },
  config = conf.leap,
}

editor['rrethy/vim-hexokinase'] = {
  config = conf.hexokinase,
  run = 'make hexokinase',
  opt = true,
  cmd = { 'HexokinaseTurnOn', 'HexokinaseToggle' },
}

editor['numToStr/Comment.nvim'] = {
  keys = { 'g', '<ESC>', 'v', 'V', '<c-v>' },
  config = conf.comment,
}

return editor
