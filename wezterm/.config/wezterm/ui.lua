local M = {}

local wezterm = require('wezterm')

local function background(config)
  local home = os.getenv('HOME')

  config.background = {
    {
      source = {
        File = home .. '/.config/wezterm/images/chaotic_gore_magala.jpeg',
      },
      hsb = {
        brightness = 0.05,
      },
    },
  }
end

function M.apply(config)
  config.enable_tab_bar = false
  config.window_background_opacity = 0.9
  config.initial_rows = 50
  config.initial_cols = 160

  config.font = wezterm.font('GoMono Nerd Font Mono')
  config.font_size = 16.0

  config.color_scheme = 'Dark+'

  background(config)
end

return M
