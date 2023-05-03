local M = {}

local wezterm = require('wezterm')

function M.apply(config)
  config.color_scheme = 'Dark+'
  config.font = wezterm.font('GoMono Nerd Font Mono')
  config.font_size = 16.0
  config.window_background_opacity = 0.9
  config.enable_tab_bar = false
  config.initial_rows = 50
  config.initial_cols = 160
end

return M
