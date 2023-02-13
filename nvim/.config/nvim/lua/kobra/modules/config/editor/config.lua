local config = {}

function config.autotag()
  require('nvim-ts-autotag').setup()
end

function config.comment()
  require('Comment').setup()
end

function config.commentstring()
  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })

  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

function config.editorconfig()
  vim.g.EditorConfig_exclude_patterns = {
    'fugitive://.*',
    'scp://.*',
    'dbui',
    'NvimTree',
    'lspinfo',
    'Mundo',
    'MundoDiff',
    'packer',
    'fugitive',
    'fugitiveblame',
    'NeogitStatus',
    'DiffViewFiles',
  }
end

function config.leap()
  require('leap').add_default_mappings()
end

function config.cinnamon()
  require('cinnamon').setup()
end

function config.focus()
  require('focus').setup()
end

return config
