local editor = {}
local conf = require('kobra.new.modules.editor.config')

editor['windwp/nvim-autopairs'] = {
  after = { 'nvim-cmp' },
  config = conf.autopairs,
  opt = true,
}

editor['ggandor/leap.nvim'] = {
  opt = true,
  module = 'leap',
  requires = {
    { 'ggandor/leap-ast.nvim', after = 'leap.nvim', opt = true, config = require('kobra.new.modules.editor.leap').ast() },
    { 'ggandor/flit.nvim', after = 'leap.nvim', opt = true, config = require('kobra.new.modules.editor.leap').flit() },
  },
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
