local config = {}

function config.notify()
  require('notify').setup({
    stages = 'slide',
    render = 'minimal',
    timeout = 5000,
  })

  require('telescope').load_extension('notify')
end

function config.alpha()
  require('kobra.modules.config.ui.start-screen').config()
end

function config.windows()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require('windows').setup()
end

function config.goto_preview()
  require('goto-preview').setup({})
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
