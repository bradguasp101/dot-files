local config = {}

function config.nvim_tree()
  local tree_cb = require('nvim-tree.config').nvim_tree_callback
  local setup = {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    update_cwd = true,
    reload_on_bufenter = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
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
  }

  -- old style mappings

  local mappings = {
    list = {
      { key = 'h', cb = tree_cb 'close_node' },
      { key = 'v', cb = tree_cb 'vsplit' },
    },
  }

  if COLEMAK then
    table.insert(mappings.list, { key = 'i', cb = tree_cb 'edit' })
    table.insert(mappings.list, { key = 'e', action = '' })
  else
    table.insert(mappings.list, { key = 'l', cb = tree_cb 'edit' })
  end

  setup.view.mappings = mappings

  -- new style mappings

  -- local api = require('nvim-tree.api')
  -- local function on_attach(bufnr)
  --   vim.keymap.set('n', 'h', function()
  --     local node = api.tree.get_node_under_cursor()
  --
  --   end, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  -- end

  require('nvim-tree').setup(setup)

  vim.g.nvim_tree_respect_buf_cwd = 1
end

function config.better_escape()
  vim.g.better_escape_shortcut = {'jk', 'qn'}
end

return config
