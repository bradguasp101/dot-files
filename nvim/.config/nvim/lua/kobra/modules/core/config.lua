local config = {}

function config.nvim_tree()
  local tree_cb = require('nvim-tree.config').nvim_tree_callback
  local setup = {
    update_focused_file = {
      enable = true,
      ignore_list = {},
    },
    view = {
      number = true,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      custom = {
        "node_modules",
        "plz-out",
      },
    },
  }

  local mappings = {
    list = {
      { key = 'h', cb = tree_cb 'close_node' },
      { key = 'v', cb = tree_cb 'vsplit' },
    },
  }

  if COLEMAK then
    table.insert(mappings.list, { key = 'i', cb = tree_cb 'edit' })
  else
    table.insert(mappings.list, { key = 'l', cb = tree_cb 'edit' })
  end

  setup.view.mappings = mappings

  require('nvim-tree').setup(setup)
end

function config.better_escape()
  vim.g.better_escape_shortcut = {'jk', 'ne'}
end

return config
