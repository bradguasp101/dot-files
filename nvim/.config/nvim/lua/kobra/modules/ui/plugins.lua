local ui = {}
local conf = require('kobra.modules.ui.config')

ui['rcarriga/nvim-notify'] = {
  opt = true,
  config = conf.notify,
}

ui['romgrk/barbar.nvim'] = {
  opt = true,
  config = conf.barbar,
}

ui['nvim-lualine/lualine.nvim'] = {
  opt = true,
  config = conf.lualine,
}

-- THEME
ui['shaunsingh/moonlight.nvim'] = {
  opt = true,
  config = conf.moonlight,
}

ui['marko-cerovac/material.nvim'] = {
  opt = true,
  -- after = 'lualine.nvim',
  config = conf.material,
}

ui['EdenEast/nightfox.nvim'] = {
  opt = true,
  config = conf.nightfox,
}

return ui
