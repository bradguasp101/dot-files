local config = {}

function config.notify()
  require('notify').setup({
    stages = 'slide',
    default = 'minimal',
  })
  require('telescope').load_extension('notify')
end

function config.nvim_tree_setup()
  vim.cmd([[autocmd Filetype NvimTree set cursorline]])
end

function config.nvim_tree()
  local tree_cb = require('nvim-tree.config').nvim_tree_callback

  require('nvim-tree').setup({
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      root_folder_modifier = ":t",
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "left",
      number = true,
      relativenumber = true,
      mappings = {
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
    },
  })
end

function config.sonokai()
  vim.g.sonokai_style = 'atlantis'
  vim.g.sonokai_better_performance = 1
  vim.cmd([[colorscheme sonokai]])
end

function config.moonlight()
  require('moonlight').set()
end

return config
