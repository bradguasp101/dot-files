local ui = {}
local conf = require('kobra.new.modules.config')

ui['kyazdani42/nvim-web-devicons'] = {}

ui['lambdalisue/glyph-palette.vim'] = {}

ui['rcarriga/nvim-notify'] = {
  opt = true,
  config = conf.notify,
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
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
  opt = true,
}

return ui
