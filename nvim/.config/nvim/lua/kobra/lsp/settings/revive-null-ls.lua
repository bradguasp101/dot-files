return function(source_name, methods)
  local null_ls = require('null-ls')
  null_ls.register(null_ls.builtins.diagnostics.revive.with({
    args = {'--config', '$ROOT/config.toml', '--formatting', 'stylish'},
  }))
end
