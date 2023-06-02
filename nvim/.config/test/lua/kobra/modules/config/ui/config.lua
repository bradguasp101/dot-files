local config = {}

function config.dressing()
  require('dressing').setup({})
end

function config.notify()
  require('notify').setup({
    stages = 'slide',
    render = 'minimal',
    timeout = 5000,
  })
  vim.notify = require('notify')
end

function config.alpha()
  require('kobra.modules.config.ui.start-screen').config()
end

function config.heirline()
  require('heirline').setup({
    statusline = require('kobra.modules.config.ui.lines.statusline').statusline(),
    winbar = require('kobra.modules.config.ui.lines.winbar').winbar(),
    -- tabline = require('kobra.modules.config.ui.lines.tabline').tabline(),
  })
end

function config.windows()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require('windows').setup()
end

function config.glance()
  local glance = require('glance')
  local actions = glance.actions

  local setup = {}
  if COLEMAK then
    setup.mappings = {
      list = {
        ['j'] = false,
        ['k'] = false,
        ['n'] = actions.next,
        ['e'] = actions.previous,
        ['<leader>l'] = false,
        ['<C-l>'] = actions.enter_win('preview'),
      },
      preview = {
        ['<leader>l'] = false,
        ['<C-l>'] = actions.enter_win('list'),
      },
    }
  end

  glance.setup(setup)
end

-- THEME
function config.moonlight()
  vim.g.moonlight_borders = true
  require('moonlight').set()
  vim.cmd 'colorscheme moonlight'
end

function config.nightfox()
  vim.cmd('colorscheme carbonfox')
end

return config
