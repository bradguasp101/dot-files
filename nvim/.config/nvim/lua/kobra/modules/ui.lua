local ui = {}
local conf = require('kobra.config.ui')

ui[#ui+1] = {
  'rcarriga/nvim-notify',
  config = conf.notify,
}

ui[#ui+1] = {
  'nanozuki/tabby.nvim',
  lazy = true,
  config = require('kobra.config.tabby').setup,
  disabled = true,
}

ui[#ui+1] = {
  'romgrk/barbar.nvim',
  config = conf.barbar,
}

ui[#ui+1] = {
  'feline-nvim/feline.nvim',
  config = require('kobra.config.feline').setup,
}

-- THEME
ui[#ui+1] = {
  'shaunsingh/moonlight.nvim',
  lazy = true,
  config = conf.moonlight,
}

ui[#ui+1] = {
  'marko-cerovac/material.nvim',
  lazy = true,
  config = conf.material,
}

ui[#ui+1] = {
  'EdenEast/nightfox.nvim',
  config = conf.nightfox,
  lazy = false, -- make sure it load this during startup
  priority = 1000, -- make sure to load this before all other start plugins
  disabled = true,
}

return ui
