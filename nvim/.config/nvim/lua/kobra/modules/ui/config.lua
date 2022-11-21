local config = {}

function config.notify()
  require('notify').setup({
    stages = 'slide',
    render = 'minimal',
    timeout = 5000,
  })

  require('telescope').load_extension('notify')
end

function config.barbar()
  require('bufferline').setup({
    insert_at_end = true,
  })

  local nt_api = require('nvim-tree.api')
  local Event = nt_api.events.Event
  local b_api = require('bufferline.api')

  local function get_tree_size()
    return require('nvim-tree.view').View.width
  end

  nt_api.events.subscribe(Event.TreeOpen, function()
    b_api.set_offset(get_tree_size())
  end)

  nt_api.events.subscribe(Event.Resize, function()
    b_api.set_offset(get_tree_size())
  end)

  nt_api.events.subscribe(Event.TreeClose, function()
    b_api.set_offset(0)
  end)
end

function config.lualine()
  lualine.setup({
    options = {
      theme = 'moonlight',
    },
  })
end

-- THEME
function config.moonlight()
  require('moonlight').set()
end

return config
