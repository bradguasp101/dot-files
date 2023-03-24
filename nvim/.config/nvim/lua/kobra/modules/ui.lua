local ui = {}
local conf = require('kobra.modules.config.ui.config')

ui[#ui+1] = {
  'rcarriga/nvim-notify',
  event = 'VimEnter',
  config = conf.notify,
}

ui[#ui+1] = {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  config = require('kobra.modules.config.ui.tabby').setup,
}

ui[#ui+1] = {
  'freddiehaddad/feline.nvim',
  event = 'VimEnter',
  config = require('kobra.modules.config.ui.feline').setup,
}

ui[#ui+1] = {
  'goolord/alpha-nvim',
  lazy = false,
  config = conf.alpha,
}

ui[#ui+1] = {
  'anuvyklack/windows.nvim',
  cmd = {
    'WindowsMaximize',
    'WindowsMaximizeVertically',
    'WindowsMaximizeHorizontally',
    'WindowsEqualize',
    'WindowsEnableAutowidth',
    'WindowsDisableAutowidth',
    'WindowsToggleAutowidth',
  },
  dependencies = {
    'anuvyklack/middleclass',
    'anuvyklack/middleclass',
  },
  config = conf.windows,
}

ui[#ui+1] = {
  'sedm0784/vim-resize-mode',
  keys = { '<C-w>' },
}

ui[#ui+1] = {
  'dnlhc/glance.nvim',
  keys = { '<leader>l' },
  cmd = { 'Glance' },
  config = conf.glance,
}

-- THEME
ui[#ui+1] = {
  'shaunsingh/moonlight.nvim',
  lazy = true,
  config = conf.moonlight,
}

ui[#ui+1] = {
  'EdenEast/nightfox.nvim',
  config = conf.nightfox,
  lazy = false, -- make sure it load this during startup
  priority = 1000, -- make sure to load this before all other start plugins
  disabled = true,
}

return ui
