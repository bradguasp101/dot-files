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

function config.autotag()
  require('nvim-ts-autotag').setup()
end

function config.comment()
  require('Comment').setup()
end

function config.commentstring()
  if packer_plugins['nvim-treesitter'] == nil or packer_plugins['nvim-treesitter'].loaded == false then
    require('packer').loader('nvim-treesitter')
  end

  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })

  if packer_plugins['Comment.nvim'] == nil or packer_plugins['Comment.nvim'].loaded == false then
    require('packer').loader('Comment.nvim')
  end

  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return config
