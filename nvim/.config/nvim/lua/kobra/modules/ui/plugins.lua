local ui = {}
local conf = require('kobra.modules.ui.config')

ui['romgrk/barbar.nvim'] = {
  opt = true,
  config = conf.barbar,
  module = 'bufferline',
}

ui['nvim-lualine/lualine.nvim'] = {
  opt = true,
  config = conf.lualine,
}

ui['kyazdani42/nvim-web-devicons'] = {}

ui['lambdalisue/glyph-palette.vim'] = {}

ui['rcarriga/nvim-notify'] = {
  opt = true,
  config = conf.notify,
}

ui['kyazdani42/nvim-tree.lua'] = {
  setup = conf.nvim_tree_setup,
  config = conf.nvim_tree,
}

ui['gorbit99/codewindow.nvim'] = {
  cmd = { 'Minimap' },
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup()
    codewindow.apply_default_keybinds()
    vim.cmd('command! -nargs=0 Minimap :lua require("codewindow").toggle_minimap()')
  end,
}

ui['sainnhe/sonokai'] = {
  config = conf.sonokai,
  opt = true,
}

ui['shaunsingh/moonlight.nvim'] = {
  config = conf.moonlight,
  module = 'moonlight',
}

return ui
