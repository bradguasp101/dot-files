local config = {}

function config.nvim_tree_setup()
  vim.cmd([[autocmd Filetype NvimTree set cursorline]])
end

function config.nvim_tree()
  local tree_cb = require('nvim-tree.config').nvim_tree_callback
  
  require('nvim-tree').setup({
    update_focused_file = {
      enable = true,
      update_cwd = true,
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
      dotfiles = true,
    },
  })
end

return config
