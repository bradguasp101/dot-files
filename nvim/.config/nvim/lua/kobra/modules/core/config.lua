local config = {}

function config.nvim_tree()
  local tree_cb = require('nvim-tree.config').nvim_tree_callback

  require('nvim-tree').setup({
    update_focused_file = {
      enable = true,
      ignore_list = {},
    },
    view = {
      number = true,
      relativenumber = true,
      mappings = {
        list = {
          { key = 'h', cb = tree_cb 'close_node' },
          { key = 'v', cb = tree_cb 'vsplit' },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      custom = {
        ".git",
        "node_modules",
        "plz-out",
      },
    },
  })
end

return config
