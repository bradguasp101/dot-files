local screen = {}

function screen.config()
  local alpha = require('alpha')
  local startify = require('alpha.themes.startify')
  local utils = require('possession.utils')

  startify.section.top_buttons.val = {
    startify.button("f", "  New file", ":ene <BAR> startinsert <CR>"),
  }

  -- disable MRU
  startify.section.mru.val = {{ type = "padding", val = 0 }}

  -- disable MRU cwd
  startify.section.mru_cwd.val = {{ type = "padding", val = 0 }}

  startify.section.bottom_buttons.val = {
    startify.button("q", "  Quit NVIM", ":qa<CR>"),
  }

  startify.section.footer = {
    { type = "text", val = "footer" },
  }

  local query = require('possession.query')
  local workspaces = {
    {
      'Projects',
      'p',
      '~/Projects/',
    },
    {
      'Dotfiles',
      'd',
      '~/dot-files/',
    },
  }

  local get_layout = function()
    return query.alpha_workspace_layout(workspaces, startify.button, {
      others_name = 'Other Sessions',
    })
  end

  local config = startify.config

  table.insert(config.layout, 5, {
    type = 'group',
    val = utils.throttle(get_layout, 5000),
  })

  alpha.setup(config)
end

return screen
