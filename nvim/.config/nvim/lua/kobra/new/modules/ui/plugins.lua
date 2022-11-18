local ui = {}
local conf = require('kobra.new.modules.config')

ui['sainnhe/sonokai'] = {
  config = conf.sonokai,
  opt = true,
}

ui['shaunsingh/moonlight.nvim'] = {
  config = conf.moonlight,
  opt = true,
}

return ui
