local config = {}

function config.notify()
  require('notify').setup({
    stages = 'slide',
    render = 'minimal',
    timeout = 5000,
  })

  require('telescope').load_extension('notify')
end

function config.tabby()
  local filename = require('tabby.filename')

  local cwd = function()
    return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
  end

  local line = {
    hl = 'TablineFill',
    layout = 'active_wins_at_tail',
    head = {
      { cwd, hl = 'UserTLHead' },
      { '', hl = 'UserTLHeadSep' },
    },
    active_tab = {
      label = function(tabid)
        return {
          "  " .. tabid .. " ",
          hl = "UserTLActive",
        }
      end,
      left_sep = { "", hl = "UserTLActiveSep" },
      right_sep = { "", hl = "UserTLActiveSep" },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          "  " .. tabid .. " ",
          hl = "UserTLBoldLine",
        }
      end,
      left_sep = { "", hl = "UserTLLineSep" },
      right_sep = { "", hl = "UserTLLineSep" },
    },
    top_win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = "UserTLLineSep" },
      right_sep = { "", hl = "UserTLLineSep" },
    },
    win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = "UserTLLineSep" },
      right_sep = { "", hl = "UserTLLineSep" },
    },
    tail = {
      { "", hl = "UserTLHeadSep" },
      { "  ", hl = "UserTLHead" },
    },
  }

  require('tabby').setup({
    tabline = line,
  })
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
  require('lualine').setup({
    options = {
      theme = 'auto',
    },
  })
end

function config.feline()
  require('feline').setup({
    force_inactive = {
      filetypes = {
        'NvimTree',
      },
    },
  })
end

-- THEME
function config.moonlight()
  vim.g.moonlight_borders = true
  require('moonlight').set()
  vim.cmd 'colorscheme moonlight'
end

function config.material()
  require('material').setup({
    plugins = {
      -- 'gitsigns',
      -- 'nvim-cmp',
      'nvim-tree',
      'nvim-web-devicons',
      -- 'telescope',
      -- 'trouble',
      -- 'which-key',
    },
  })

  vim.g.material_style = 'deep ocean'
  vim.cmd 'colorscheme material'
end

function config.nightfox()
  vim.cmd('colorscheme carbonfox')
end

return config
