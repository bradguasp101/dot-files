local config = {}

function config.telescope_setup()
  if not packer_plugins['plenary.nvim'].loaded then
    require('packer').loader('plenary.nvim')
  end
end

function config.telescope()
  require('kobra.modules.tools.telescope').setup()
end

function config.neodev() end

function config.neogen()
  require('neogen').setup({
    enabled = true,
  })
end

function config.refactor()
  require('refactoring').setup({})
end

function config.hlargs()
  require('hlargs').setup()
end

function config.gitsigns()
  require('gitsigns').setup()
end

function config.git_conflict()
  require('git-conflict').setup()
end

function config.fugitive_gitlab()
  vim.g.fugitive_gitlab_domains = {'http://git', 'http://git.tcncloud.net'}
end

function config.trouble()
  require('trouble').setup()
end

return config
