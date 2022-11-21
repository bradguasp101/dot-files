local config = {}

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
