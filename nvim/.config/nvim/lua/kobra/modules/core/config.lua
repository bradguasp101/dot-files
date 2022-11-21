local config = {}

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
    }
  })
end

function config.autotag()
  require('nvim-ts-autotag').setup()
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

  require('Comment').setup({
    pre_hook = require('ts_context_commenstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return config
