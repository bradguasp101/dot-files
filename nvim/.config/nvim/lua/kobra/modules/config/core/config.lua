local config = {}

function config.better_escape()
  require('better_escape').setup({
    mapping = {'jk', 'qn'},
  })
end

return config
