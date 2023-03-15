local config = {}

function config.better_escape()
  require('better_escape').setup({
    mapping = {'jk', 'qn'},
  })
end

function config.project()
  require('project_nvim').setup({
    show_hidden = false,
  })
end

function config.possession()
  require('possession').setup({})
end

function config.alpha()
  require('kobra.modules.config.core.start-screen').config()
end

return config
