local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

require('ui').apply(config)
require('keys').apply(config)

return config
