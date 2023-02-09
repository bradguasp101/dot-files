local ui = {}
local conf = require('kobra.modules.ui.config')

ui[#ui+1] = {
  'rcarriga/nvim-notify',
  config = conf.notify,
}

ui[#ui+1] = {
  'romgrk/barbar.nvim',
  config = conf.barbar,
}

ui[#ui+1] = {
  'nvim-lualine/lualine.nvim',
  config = conf.lualine,
}

-- THEME
ui[#ui+1] = {
  'shaunsingh/moonlight.nvim',
  config = conf.moonlight,
  disabled = true,
}

ui[#ui+1] = {
  'marko-cerovac/material.nvim',
  config = conf.material,
  disabled = true,
}

ui[#ui+1] = {
  'EdenEast/nightfox.nvim',
  lazy = false, -- make sure it load this during startup
  priority = 1000, -- make sure to load this before all other start plugins
  config = conf.nightfox,
}

return ui
